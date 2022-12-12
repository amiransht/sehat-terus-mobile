# Tugas Proyek Akhir Semester

[![development](https://github.com/amiransht/sehat-terus-mobile/blob/main/.github/workflows/development.yml/badge.svg)](https://github.com/amiransht/sehat-terus-mobile/blob/main/.github/workflows/development.yml)
[![pre-release](https://github.com/amiransht/sehat-terus-mobile/blob/main/.github/workflows/pre-release.yml/badge.svg)](https://github.com/amiransht/sehat-terus-mobile/blob/main/.github/workflows/pre-release.yml)
[![release](https://github.com/amiransht/sehat-terus-mobile/blob/main/.github/workflows/release.yml/badge.svg)](https://github.com/amiransht/sehat-terus-mobile/blob/main/.github/workflows/release.yml)
[![Build status](https://build.appcenter.ms/v0.1/apps/1256feb0-8961-4072-bf1b-1bebf1e53756/branches/main/badge)](https://appcenter.ms)
## Sehat Terus Mobile Application

Kelompok F03:

- Dimitri Prima Nugraha - 2106750396
- Refiany Shadrina - 2106650185
- Amira Nisrina Nashita - 2106703815
- Monica Shannon Clio Aurelie - 2106751732
- Raihan Kus Putranto - 2106703821


## Aplikasi

### 🚀 Tautan Aplikasi Mobile Sehat Terus  🚀
Kunjungi aplikasi mobile kami [di sini](https://install.appcenter.ms/orgs/sehat-terus/apps/sehat-terus-mobile/distribution_groups/public/releases/1)


SehatTerus merupakan aplikasi yang dikembangkan untuk membantu warga dalam mengetahui perkembangan penyebaran virus COVID-19. Selain itu, aplikasi ini juga ditujukan untuk memungkinkan para tenaga kesehatan melakukan tracking secara digital terhadap pasien COVID-19 yang masih membutuhkan bantuan.

Dengan mengunjungi laman utama aplikasi SehatTerus, para pengguna aplikasi akan melihat rangkuman dan statistik data yang dimasukkan pada aplikasi tersebut dan data statistik real-time perkembangan COVID-19 di Indonesia. Selain itu, pada halaman tersebut terdapat card yang berisi link menuju berita-berita terkini mengenai COVID-19 di seluruh dunia.

## Daftar Modul
Refiany: 
1. Autentikasi 
2. Profil - Menampilkan informasi tentang User yang sedang login
3. Settings & Dashboard Profile - Memungkinkan user untuk melakukan perubahan terhadap profil mereka.

Amira:
1. Homepage - Menampilkan banner, infografis, rangkuman statistik data jumlah pasien Covid di Indonesia & Kelurahan Sehat Terus, dan berita-berita seputar Covid-19
2. Tentang Website - Menampilkan beberapa informasi mengenai website kepada seluruh user
3. Base, Navbar

Dimitri:
Create Data Pasien & Lurah Page - Menambahkan data identitas pasien covid dan menampilkannya dalam bentuk card

Raihan:
Nakes Page - Menampilkan data pasien covid di kelurahan Sehat terus dan Mengupdate status kesehatan pasien

Shannon:
1. FAQ - Menampilkan pertanyaan dan jawaban terkait COVID 19
2. Blog - Menampilkan blog yang dibuat Nakes terkait informasi kesehatan


## Role
- User belum login: Lihat HomePage, Lihat Tentang Website, Lihat FAQ & Blog
- Tenaga Kesehatan: Lihat HomePage, Lihat Tentang Website, Lihat FAQ, Lihat dan Edit Nakes Page, Membuat Blog
- Lurah: Lihat HomePage, Lihat Tentang Website, Lihat FAQ & Blog, Lihat dan Edit Lurah Page Page

## Alur Integrasi dengan Web Service
- Membuat sebuah class remote data source yang berisi HTTP Client untuk melakukan HTTP request ke Rest API Sehat Terus
- Mengimplementasikan desain front-end aplikasi mobile berdasarkan desain front-end aplikasi website sebelumnya
- Melakukan integrasi antara front-end dengan back-end pada Rest API Sehat Terus menggunakan konsep asynchronous programming
