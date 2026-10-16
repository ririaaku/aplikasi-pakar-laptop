-- 1. Buat dan gunakan database
CREATE DATABASE IF NOT EXISTS db_sistempakar;
USE db_sistempakar;

-- 2. Buat tabel Gejala
CREATE TABLE gejala (
  id_gejala VARCHAR(10) PRIMARY KEY,
  pertanyaan TEXT
);

-- 3. Buat tabel Kerusakan
CREATE TABLE kerusakan (
  id_kerusakan VARCHAR(10) PRIMARY KEY,
  nama_kerusakan VARCHAR(100),
  deskripsi TEXT,
  solusi TEXT
);

-- 4. Buat tabel Aturan (Rule Base)
CREATE TABLE aturan (
  id_aturan INT AUTO_INCREMENT PRIMARY KEY,
  kondisi VARCHAR(255),
  id_kerusakan VARCHAR(10),
  FOREIGN KEY (id_kerusakan) REFERENCES kerusakan(id_kerusakan)
);

-- 5. Buat tabel Riwayat Diagnosis
CREATE TABLE riwayat (
  id_riwayat INT AUTO_INCREMENT PRIMARY KEY,
  tanggal DATETIME,
  merk_laptop VARCHAR(100),
  hasil_diagnosis VARCHAR(100),
  persentase FLOAT
);