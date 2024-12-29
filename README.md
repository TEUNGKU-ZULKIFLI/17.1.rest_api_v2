# REST API V2

Proyek ini adalah aplikasi manajemen sumber daya yang lengkap, terdiri dari backend (server API) dan frontend yang dibangun dengan Flutter. Aplikasi ini memungkinkan pengguna untuk mengelola daftar sumber daya (operasi CRUD: Create, Read, Update, dan Delete).

# Prasyarat

Sebelum memulai, pastikan Anda sudah menginstal hal-hal berikut:

1. **Node.js dan npm**:  
   - Anda bisa mengunduh Node.js dari [sini](https://nodejs.org/).
   - npm sudah termasuk dengan Node.js, jadi jika Anda sudah menginstal Node.js, Anda sudah memiliki npm.

2. **Flutter SDK**:  
   - Anda bisa menginstal Flutter dari [sini](https://flutter.dev/docs/get-started/install).

3. **Editor/IDE**:  
   - Anda bisa menggunakan editor kode seperti [VSCode](https://code.visualstudio.com/) atau Android Studio untuk bekerja dengan aplikasi Flutter.



# Langkah-langkah untuk Mengatur

## 01. Pastikan Node.js Terinstal

Pastikan Node.js sudah terinstal di sistem Anda. Untuk memeriksanya, buka terminal atau command prompt dan jalankan perintah berikut:

```bash
node -v
```
**&**
```bash
npm -v
```

Jika perintah ini mengembalikan versi Node.js, berarti Node.js sudah terinstal. Jika tidak, Anda perlu menginstalnya terlebih dahulu dengan mengunjungi [halaman unduhan Node.js](https://nodejs.org/).

## 02. Clone repo 📁 `api-server`
- **BISA KLIK LINK DAN CLONE** https://github.com/TEUNGKU-ZULKIFLI/api-server

## 03. Jalankan Server API

### 1. Buka terminal atau command prompt.
### 2. Arahkan ke folder `api-server`. Anda bisa melakukannya dengan menggunakan perintah `cd` di terminal:

```bash
cd path_ke_folder_cloning/api-server
```

   Gantilah `path_ke_folder_cloning` dengan lokasi folder tempat Anda mengclone `api-server`.
   **SECARA SHORTCUT CLICK KANAN FOLDER api-server DAN PILIH OPEN IN TERMINAL 😁👌🏻**

### 3. Setelah berada di dalam folder `api-server`, jalankan server dengan perintah berikut:

   **Installasi package express**

```bash
npm install express --save
```

   **Installasi package cors**

```bash
npm install cors --save
```

   **Dan disusul**

```bash
node server.js
```

   Ini akan memulai server API yang dapat diakses di `http://localhost:3000`. Server backend sekarang berjalan dan siap menerima permintaan.

## 04. Jalankan Aplikasi Flutter

### 1.Jalankan perintah berikut untuk memulai aplikasi Flutter:

```bash
flutter run
```

   Ini akan meluncurkan aplikasi Flutter. Anda akan melihat daftar sumber daya yang diambil dari server backend (yang berjalan di `localhost:3000`).

   **Periksa apakah Data Ditampilkan**:  
   Jika semuanya sudah diatur dengan benar, Anda akan melihat daftar sumber daya yang ditampilkan di layar. Sumber daya ini diambil dari API backend.

## 05. Uji Operasi CRUD (Buat, Baca, Perbarui, Hapus)

### **Sekarang Anda bisa menguji semua operasi CRUD melalui aplikasi Flutter:**

### 1. **Create (Buat)**:  
   - Klik tombol "Tambah" (tombol aksi mengambang di layar).
   - Isi formulir dengan detail sumber daya baru (Nama dan ID Mahasiswa).
   - Klik tombol "Kirim" untuk mengirim data ke backend dan menambahkan sumber daya baru.

### 2. **Update (Perbarui)**:  
   - Ketuk salah satu sumber daya dalam daftar.
   - Aplikasi akan membuka layar untuk mengedit. Perbarui kolom (Nama atau ID Mahasiswa) dan klik "Perbarui".
   - Data yang diperbarui akan dikirimkan ke backend.

### 3. **Delete (Hapus)**:  
   - Ketuk ikon sampah di sebelah sumber daya yang ingin dihapus.
   - Sebuah dialog konfirmasi akan muncul. Jika Anda mengonfirmasi, sumber daya tersebut akan dihapus dari frontend dan backend.

## 06. 💥 Akhirnya

### **Setelah Anda menguji semua operasi CRUD (Buat, Baca, Perbarui, Hapus) dan semuanya berjalan dengan baik, Anda selesai! 🎉**


# Struktur Proyek

- **Backend (Server API)**:
  - Server backend dibangun menggunakan Node.js, Express, Cors. Server ini mendengarkan di `http://localhost:3000` dan `http://<alamat_IP>:3000` serta menangani permintaan untuk mengelola sumber daya (GET, POST, PUT, DELETE).
  
  - **File Utama**:
    - `server.js`: File utama backend yang menjalankan server API.
  
- **Frontend (Aplikasi Flutter)**:
  - Frontend adalah aplikasi Flutter yang terhubung ke server API untuk mengelola sumber daya.
  
  - **File Utama**:
    - `main.dart`: Titik masuk aplikasi Flutter, menampilkan daftar sumber daya dan menangani navigasi.
    - `api_service.dart`: File yang menangani komunikasi dengan server API (operasi fetch, create, update, dan delete).
    - `add_resource_screen.dart`: Layar tempat pengguna dapat menambahkan sumber daya baru.
    - `edit_resource_screen.dart`: Layar tempat pengguna dapat mengedit sumber daya yang ada.

---

# Pemecahan Masalah

- Jika Anda mengalami masalah dengan server backend (seperti tidak bisa mengambil data atau kesalahan lainnya), pastikan server sudah berjalan dengan memeriksa terminal untuk kesalahan.
- Jika aplikasi Flutter tidak menampilkan data, pastikan server berjalan dengan benar dan aplikasi Anda dapat terhubung ke server di `http://localhost:3000`.
> Jika Anda merunningnya dengan no **`[2]Google Chrome`** , **`[3]Edge`**, dan lainnya, bisa mengganti di `lib\service\api_service.dart` pada baris 4-5:
>
> ```dart
> class ApiService {
> static const String baseUrl = 'http://localhost:3000/api/resources';
> ```
> 
> **Ganti menjadi:**
> ```dart
> class ApiService {
> static const String baseUrl = 'http://<alamat_IP>:3000/api/resources';
> ```

## **PASTIKAN SELALU MENGHIDUPKAN SERVER TERLEBIH DAHULU BARU DISUSUL DENGAN FLUTTER RUN 😁.**

# SHOWCASE
<div align="center">
  <img src="https://raw.githubusercontent.com/TEUNGKU-ZULKIFLI/PROJECT-FLUTTER/refs/heads/master/asset/img/017.V2.1.png" width="200px"/>
  <img src="https://raw.githubusercontent.com/TEUNGKU-ZULKIFLI/PROJECT-FLUTTER/refs/heads/master/asset/img/017.V2.2.png" width="200px"/>
  <img src="https://raw.githubusercontent.com/TEUNGKU-ZULKIFLI/PROJECT-FLUTTER/refs/heads/master/asset/img/017.V2.3.png" width="200px"/>
  <img src="https://raw.githubusercontent.com/TEUNGKU-ZULKIFLI/PROJECT-FLUTTER/refs/heads/master/asset/img/017.V2.4.png" width="200px"/>
</div>
