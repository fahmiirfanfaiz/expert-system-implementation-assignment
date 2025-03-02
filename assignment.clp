; TUGAS IMPLEMENTASI EXPERT SYSTEM DENGAN TEMA SISTEM PAKAR PEMILIHAN JURUSAN KULIAH BERBASIS MINAT DAN KEMAMPUAN
; Nama : Fahmi Irfan Faiz
; NIM : 23/520563/TK/57396
; Kelas : B​

; Mendefinisikan template user-data untuk menyimpan data pengguna
(deftemplate MAIN::user-data
   (slot nama)
   (slot matematika (type SYMBOL) (allowed-symbols rendah sedang tinggi))
   (slot fisika (type SYMBOL) (allowed-symbols rendah sedang tinggi))
   (slot kimia (type SYMBOL) (allowed-symbols rendah sedang tinggi))
   (slot biologi (type SYMBOL) (allowed-symbols rendah sedang tinggi))
   (slot informatika (type SYMBOL) (allowed-symbols rendah sedang tinggi))
   (slot sosiologi (type SYMBOL) (allowed-symbols rendah sedang tinggi))
   (slot ekonomi (type SYMBOL) (allowed-symbols rendah sedang tinggi))
   (slot sejarah (type SYMBOL) (allowed-symbols rendah sedang tinggi))
   (slot geografi (type SYMBOL) (allowed-symbols rendah sedang tinggi)))

; Mendefinisikan template rekomendasi untuk menyimpan data rekomendasi jurusan
(deftemplate MAIN::rekomendasi
   (slot jurusan))

; Mendefinisikan rule berdasarkan masukan data pengguna untuk merekomendasikan jurusan yang sesuai dengan minat dan kemampuan
(defrule MAIN::teknik-elektro
   (user-data (matematika tinggi) (fisika tinggi) (informatika sedang|tinggi))
   =>
   (assert (rekomendasi (jurusan "Teknik Elektro"))))

(defrule MAIN::teknologi-informasi
   (user-data (matematika tinggi) (fisika sedang|tinggi) (informatika tinggi))
   =>
   (assert (rekomendasi (jurusan "Teknologi Informasi"))))

(defrule MAIN::teknik-biomedis
   (user-data (matematika tinggi) (fisika tinggi) (informatika sedang|tinggi) (kimia tinggi) (biologi tinggi))
   =>
   (assert (rekomendasi (jurusan "Teknik Biomedis"))))

(defrule MAIN::farmasi
   (user-data (kimia tinggi) (biologi tinggi))
   =>
   (assert (rekomendasi (jurusan "Farmasi"))))

(defrule MAIN::kedokteran
   (user-data (biologi tinggi) (kimia tinggi))
   =>
   (assert (rekomendasi (jurusan "Kedokteran"))))

(defrule MAIN::hukum
   (user-data (sosiologi tinggi) (ekonomi tinggi) (sejarah sedang|tinggi))
   =>
   (assert (rekomendasi (jurusan "Hukum"))))

(defrule MAIN::manajemen
   (user-data (sosiologi tinggi) (ekonomi tinggi))
   =>
   (assert (rekomendasi (jurusan "Manajemen"))))

(defrule MAIN::akuntansi
   (user-data (matematika tinggi) (ekonomi tinggi))
   =>
   (assert (rekomendasi (jurusan "Akuntansi"))))

(defrule MAIN::ilmu-ekonomi
   (user-data (matematika tinggi) (ekonomi tinggi))
   =>
   (assert (rekomendasi (jurusan "Ilmu Ekonomi"))))

(defrule MAIN::geofisika
   (user-data (fisika tinggi) (geografi tinggi))
   =>
   (assert (rekomendasi (jurusan "Geofisika"))))

; Mendefinisikan rule untuk menerima masukan data pengguna
(defrule MAIN::user-input
   (declare (salience 1))
   =>
   (printout t "Masukkan nama anda : ")(bind ?nama (read))
   (printout t "Masukkan minat dan kemampuan anda (rendah/sedang/tinggi) : " crlf)
   (printout t "Matematika : ")
   (bind ?mat (read))
   (printout t "Fisika : ")
   (bind ?fis (read))
   (printout t "Kimia : ")
   (bind ?kim (read))
   (printout t "Biologi : ")
   (bind ?bio (read))
   (printout t "Informatika : ")
   (bind ?infor (read))
   (printout t "Sosiologi : ")
   (bind ?sos (read))
   (printout t "Ekonomi : ")
   (bind ?eko (read))
   (printout t "Sejarah : ")
   (bind ?sej (read))
   (printout t "Geografi : ")
   (bind ?geo (read))
   (assert (user-data (nama ?nama) (matematika ?mat) (fisika ?fis) (kimia ?kim) 
   (biologi ?bio) (informatika ?infor) (sosiologi ?sos) (ekonomi ?eko) (sejarah ?sej) 
   (geografi ?geo))))

; Mendefinisikan rule untuk menampilkan rekomendasi jurusan pengguna
(defrule MAIN::tampilkan-rekomendasi
   (declare (salience -1))
   (rekomendasi (jurusan ?j))
   =>
   (printout t "Rekomendasi jurusan untuk anda : " ?j crlf))

