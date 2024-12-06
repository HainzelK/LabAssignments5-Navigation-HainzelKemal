## Cara Install dan Pakai
Pastikan Anda telah menginstal Flutter SDK dan Dart di komputer Anda.
Pastikan ada editor kode seperti Android Studio atau Visual Studio Code.

### Langkah-langkah Instalasi
1. Clone repositori ini ke komputer Anda:
   ```bash
    git clone https://github.com/HainzelK/LabActivity-RoutesNavigation.git
    ```
   atau melalui tombol open with github desktop jika anda memiliki github desktop
   kemudian klik clone
   
3. Navigasikan ke direktori proyek:
   ```bash
    cd navigation_codelab
   ```
   atau navigasi ke folder yang ada hasil gitclonenya
   
5. Jalankan perintah berikut untuk menginstal dependensi:
   ```bash
   flutter pub get
   ```
   

### Cara Menjalankan Aplikasi
1. Hubungkan perangkat Android atau iOS Anda, siapkan emulator atau run menggunakan web edge.
2. Jalankan aplikasi dengan perintah berikut:
   ```bash
    flutter run
   ```
   atau menggunakan tombol start debugging menggunakan emulator, perangkat Android/iOS        atau web (jika di VSCode)
4. Pastikan jika menggunakan web, anda memiliki koneksi internet yang bagus.
### Cara penggunaan aplikasi
- Pada screen pertama, bisa mengisi berapa banyak screen yang ingin dibuat di textfield kemudian klik generate pages. Tombol ini akan membawa anda ke screen list page yang sudah dibuatkan.
- Pada screen dynamic pages, anda bisa klik page mana yang ingin dilihat. Di dalam page tersebut anda bisa klik go to next page yang akan membawa anda ke page selanjutnya atau klik tombol back to first screen untuk kembali ke screen pertama. 
- Pada screen kedua, klik tombol go back to the first screen untuk kembali ke screen pertama atau klik tombol to the third screen untuk ke screen ketiga.
- Pada screen ketiga, klik tombol go back to the first screen untuk kembali ke screen pertama atau klik tombol to the second screen untuk ke screen kedua.
- Pada ketiga screen, ada navbar yang dipakai untuk berpindah screen. Tombol first untuk ke first screen, tombol second untuk ke second screen, dan tombol third untuk ke third screen.
- Pada semua screen termasuk screen yang dibuat oleh inputan user, ada tombol back yang akan membawa user kembali ke screen pertama.

## Approach
Untuk mengerjakan tugas ini, saya melanjutkan dari tugas lab activity 5 dimana saya membuat tiga page yang bisa navigasi maju mundur page dan memiliki routing. Disini, saya menambahkan passing argument antar page. Jadi jika anda berpindah dari screen pertama ke screen kedua maka akan ada text "Hello from First Screen" dan jika dari screen kedua ke screen pertama maka akan ada teks "Hello from Second Screen" begitu juga dari screen satu ke screen ketiga dan sebaliknya. Selanjutnya saya mencoba membuat dynamic routing menggunakan passing argument tadi. Jadi di screen pertama, ada textfield yang bisa diisi angka. Angka ini akan dipakai menjadi total screen yang akan digenerate. Dari screen pertama, argumen ini akan di-pass ke screen dynamic pages. Di page ini, angka itu akan dipakai untuk membuat list item sebanyak angka itu. Item-item ini adalah page-page yang tergenerate saat angka dari screen pertama dikirim melalui tombol generate pages. Angka ini juga akan dipass ke page yang tergenerate agar aplikasinya bisa tahu ini page keberapa dan page ini bisa berpindah ke screen sebelum dan setelahnya atau tidak.

## Challenges
Untuk proyek kali ini, tantangan yang saya hadapi adalah saat saya mencoba passing data pertama kali, muncul error saat dari screen kedua atau ketiga ke screen pertama atau screen ketiga ke screen kedua dan sebaliknya. Error ini berupa error type null. Ini terjadi karena saya tidak memberikan argumen dari screen kedua atau ketiga ke screen pertama dan screen pertama meng-expect sebuah argumen sehingga keluar error itu. Jadi cara saya menyelesaikan error ini adalah dengan cara memberikan sebuah error handling dimana jika tidak ada argumen yang diberikan maka akan keluar teks "No data passed" di screen kedua dan ketiga. Saya juga menambahkan argumen di setiap tombol agar ada argumen yang dapat dipass ke screen selanjutnya. Saya juga membatasi page yang bisa dibuat menjadi hanya 500 page agar screen dynamic pages tidak terlalu berat dan membuat aplikasi ngelag.

## Advanced Features
Advanced feature di proyek ini adalah dynamic routing karena saya harus passing data yang sama dari screen pertama ke screen dynamic pages kemudian terakhir ke screen page itu sendiri. Data ini juga yang dipakai untuk membuat list page pada screen dynamic pages dan menentukan apakah page ini page yang benar dan agar navigasi ke page sebelum atau selanjutnya juga cocok.  

