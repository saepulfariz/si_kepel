<?php
include('../config.php');

$nama_pelanggan = $_POST['nama_pelanggan'];
$alamat_pelanggan = $_POST['alamat_pelanggan'];
$telepon_pelanggan = $_POST['telepon_pelanggan'];
$email_pelanggan = $_POST['email_pelanggan'];

$insert = mysqli_query($conn, "insert into pelanggan (nama_pelanggan, alamat_pelanggan, telepon_pelanggan, email_pelanggan) 
							values 
							('$nama_pelanggan', '$alamat_pelanggan', '$telepon_pelanggan', '$email_pelanggan')");

$query = "SELECT idpelanggan FROM pelanggan ORDER BY idpelanggan DESC";
$sql = mysqli_query($conn, $query);
$row = mysqli_fetch_assoc($sql);

$idpelanggan = $row['idpelanggan'];
$keluhan = $_POST['keluhan'];
$penyebab = $_POST['penyebab'];
$tindakan = $_POST['tindakan'];
$tgl_keluhan = $_POST['tgl_keluhan'];
$tgl_perbaikan = $_POST['tgl_perbaikan'];
$idteknisi = $_POST['idteknisi'];

mysqli_query($conn, "insert into keluhan (idpelanggan, keluhan, penyebab, tindakan, tgl_keluhan, tgl_perbaikan, idteknisi) 
							values 
							('$idpelanggan', '$keluhan', '$penyebab', '$tindakan', '$tgl_keluhan', '$tgl_perbaikan', '$idteknisi')");


$data =  (isset($_SESSION['teknisi'])) ? $_SESSION['teknisi'] : [];

$query = "SELECT idkeluhan FROM keluhan ORDER BY idkeluhan DESC";
$sql = mysqli_query($conn, $query);
$row = mysqli_fetch_assoc($sql);

foreach ($data as $d) {
	mysqli_query($conn, "insert into keluhan_teknisi (idkeluhan, idteknisi) 
							values 
							(" . $row['idkeluhan'] . "," . $d['idteknisi'] . ")");
}
header('location:keluhan.php');
