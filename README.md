# Tugas Proyek Akhir Semester
## Sehat Terus Mobile Application

Kelompok F03:

Dimitri Prima Nugraha - 2106750396
Refiany Shadrina - 2106650185
Amira Nisrina Nashita - 2106703815
Monica Shannon Clio Aurelie - 2106751732
Raihan Kus Putranto - 2106703821


## Aplikasi

SehatTerus merupakan aplikasi yang dikembangkan untuk membantu warga dalam mengetahui perkembangan penyebaran virus COVID-19. Selain itu, aplikasi ini juga ditujukan untuk memungkinkan para tenaga kesehatan melakukan tracking secara digital terhadap pasien COVID-19 yang masih membutuhkan bantuan.

Dengan mengunjungi laman utama website SehatTerus, para pengguna aplikasi awalnya akan ditujukan di halaman pertama yang berisikan rangkuman dan statistik data yang dimasukkan pada aplikasi tersebut dan data statistik perkembangan COVID-19 di INDONESIA APA JAKARTA. Selain itu, pada halaman tersebut terdapat card yang berisi link menuju berita-berita terkini mengenai COVID-19 di seluruh dunia.

## Daftar Modul
Refiany
1. Autentikasi 
2. Profil - Menampilkan informasi tentang User yang sedang login
3. Settings & Dashboard Profile - Memungkinkan user untuk melakukan perubahan terhadap profil mereka.
Amira
1. Homepage - Menampilkan banner, infografis, rangkuman statistik data jumlah pasien Covid, dan berita-berita seputar Covid-19
2. Tentang Website - Menampilkan beberapa informasi mengenai website kepada seluruh user
3. Base, Navbar
Dimitri
1. Create Data Pasien & Lurah Page - Menambahkan data identitas pasien covid dan menampilkannya dalam bentuk card
Raihan
1. Nakes Page - Menampilkan data pasien covid yang membutuhkan
Shannon
1. FAQ - Menampilkan pertanyaan dan jawaban terkait website
2. Blog - Menampilkan blog yang dibuat Nakes terkait informasi kesehatan


## Role
- User belum login: Lihat HomePage, Lihat Tentang Website, Lihat FAQ & Blog
- Tenaga Kesehatan: Lihat HomePage, Lihat Tentang Website, Lihat FAQ, Lihat dan Edit Nakes Page, Membuat Blog
- Lurah: Lihat HomePage, Lihat Tentang Website, Lihat FAQ & Blog, Lihat dan Edit Lurah Page Page

## Alur Integrasi dengan Web Service
- Membuat sebuah class remote data source yang berisi HTTP Client untuk melakukan HTTP request ke Rest API Sehat Terus
- Mengimplementasikan desain front-end aplikasi mobile berdasarkan desain front-end aplikasi website sebelumnya
- Melakukan integrasi antara front-end dengan back-end pada Rest API Sehat Terus menggunakan konsep asynchronous programming
