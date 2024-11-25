import 'package:flutter/material.dart';
import 'screens/add_resource_screen.dart';
import 'screens/edit_resource_screen.dart'; // Import the Edit screen
import 'services/api_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Resource Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ResourceListScreen(),
    );
  }
}

class ResourceListScreen extends StatefulWidget {
  @override
  _ResourceListScreenState createState() => _ResourceListScreenState();
}

class _ResourceListScreenState extends State<ResourceListScreen> {
  ApiService apiService = ApiService();
  late Future<List<dynamic>> resources;

  @override
  void initState() {
    super.initState();
    resources = apiService.fetchResources();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resource List'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: resources,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No resources found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final resource = snapshot.data![index];
                return ListTile(
                  title: Text(resource['name']),
                  subtitle: Text(resource['student_id']),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          // Navigate to the Edit Resource screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  EditResourceScreen(resource: resource),
                            ),
                          ).then((_) {
                            setState(() {
                              resources = apiService.fetchResources();
                            });
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Delete Resource'),
                              content: Text(
                                  'Are you sure you want to delete this resource?'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    apiService
                                        .deleteResource(resource['id'])
                                        .then((_) {
                                      setState(() {
                                        resources = apiService.fetchResources();
                                      });
                                      Navigator.pop(context);
                                    }).catchError((error) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text('Error: $error'),
                                      ));
                                    });
                                  },
                                  child: Text('Delete'),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddResourceScreen()),
          ).then((value) {
            setState(() {
              resources = apiService.fetchResources();
            });
          });
        },
      ),
    );
  }
}
