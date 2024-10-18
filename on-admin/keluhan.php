<?php include "../config.php"; ?>

<?php

if (isset($_GET['setteknisi'])) {
  $idteknisi = $_GET['idteknisi'];
  $query = "SELECT * FROM teknisi where idteknisi = " . $idteknisi;
  $sql = mysqli_query($conn, $query);
  $row = mysqli_fetch_assoc($sql);
  $nama = $row['nama_teknisi'];
  $data = [
    'id' => random_int(1, 10) . time(),
    'idteknisi' => $idteknisi,
    'nama' => $nama,
  ];
  $_SESSION['teknisi'][] = $data;
  echo json_encode($data);
  die;
}

if (isset($_GET['delteknisi'])) {
  $id = $_GET['id'];
  $data =  (isset($_SESSION['teknisi'])) ? $_SESSION['teknisi'] : [];
  $new = [];
  foreach ($data as $d) {
    if ($d['id'] != $id) {
      $new[] = $d;
    }
  }

  $_SESSION['teknisi'] = $new;

  $data = [
    'data' => $new
  ];

  echo json_encode($data);

  die;
}

if (isset($_GET['showteknisi'])) {
  $data =  (isset($_SESSION['teknisi'])) ? $_SESSION['teknisi'] : [];
  foreach ($data as $d): ?>

    <div class="row">
      <div class="col-lg-2">
      </div>
      <div class="col-lg-8">
        <input type="text" value="<?= $d['nama']; ?>" readonly class="form-control">
      </div>
      <div class="col-lg-2">
        <button type="button" onclick="delteknisi('<?= $d['id']; ?>')" class="btn btn-danger"><i class="glyphicon glyphicon-minus"></i></button>
      </div>
    </div>
    <div style="height:10px;"></div>
<?php endforeach;
  die;
}

?>

<?php include "template/header.php" ?>
<?php include "template/sidebar.php" ?>
<?php include('tambah_modalkeluhan.php'); ?>

<body>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Dashboard
        <small>Data Keluhan</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Dashboard</li>
      </ol>
    </section>
    <!-- Main content -->
    <section class="content">
      <!-- Small boxes (Stat box) -->
      <div class="box">
        <div class="box-header">
          <h3 class="box-title">Data Keluhan</h3>
        </div>
        <!-- /.box-header -->
        <div class="box-body">
          <div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
            <span class="pull-left"><a href="#tambah_keluhan" data-toggle="modal" class="btn btn-primary"><span class="glyphicon glyphicon-plus"></span>Tambah Keluhan</a></span>
            <span class="pull-right"><a href="ekspor_pdf_keluhan.php" target="blank" class="btn btn-primary"><span class="fa fa-download"></span>&nbsp; Ekspor Keluhan</a></span>
            <div style="height:50px;"></div>
            <div class="box-body table-responsive">
              <table id="keluhantable" class="table table-bordered table-striped">
                <thead>
                  <th>Nama Pelanggan</th>
                  <th>Keluhan</th>
                  <th>Penyebab</th>
                  <th>Tindakan</th>
                  <th>Tgl Keluhan</th>
                  <th>Tgl Perbaikan</th>
                  <th>Nama Teknisi</th>
                  <th>Action</th>
                </thead>
                <tbody>
                  <?php
                  $query = mysqli_query($conn, "select * from keluhan INNER JOIN pelanggan ON keluhan.idpelanggan = pelanggan.idpelanggan
		INNER JOIN teknisi ON keluhan.idteknisi = teknisi.idteknisi ");
                  while ($row = mysqli_fetch_array($query)) {
                  ?>
                    <tr>
                      <td><?php echo $row['nama_pelanggan']; ?></td>
                      <td><?php echo $row['keluhan']; ?></td>
                      <td><?php echo $row['penyebab']; ?></td>
                      <td><?php echo $row['tindakan']; ?></td>
                      <td><?php echo $row['tgl_keluhan']; ?></td>
                      <td><?php echo $row['tgl_perbaikan']; ?></td>
                      <td>
                        <ul>
                          <?php

                          $qa = mysqli_query($conn, "select * from keluhan_teknisi LEFT JOIN teknisi ON keluhan_teknisi.idteknisi = teknisi.idteknisi WHERE idkeluhan =  " . $row['idkeluhan']);
                          while ($d = mysqli_fetch_array($qa)) {
                          ?>
                            <li><?= $d['nama_teknisi']; ?></li>

                          <?php
                          }
                          ?>
                        </ul>
                      </td>
                      <td>
                        <a href="#edit_keluhan<?php echo $row['idkeluhan']; ?>" data-toggle="modal" class="btn btn-xs btn-default"><span class="glyphicon glyphicon-edit"></span> Edit</a>
                        <a href="#delete_keluhan<?php echo $row['idkeluhan']; ?>" data-toggle="modal" class="btn btn-xs btn-default"><span class="glyphicon glyphicon-trash"></span> Delete</a>
                        <?php include('button_keluhan.php'); ?>
                      </td>
                    </tr>
                  <?php
                  }

                  ?>
                </tbody>
              </table>
            </div>
          </div>

          <script type="text/javascript">
            $(function() {
              $('#keluhantable').dataTable();
            });
          </script>
          <?php include "template/footer.php" ?>
</body>

</html>