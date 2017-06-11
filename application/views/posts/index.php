<h2><?= $title ?></h2>
<a class="btn btn-success pull-right" href="<?php echo base_url();?>posts/create">Vytvor nove jedlo</a>
<?php foreach($jedla as $jedlo) : ?>
    <h3><?php echo $jedlo['Nazov_jedla']; ?></h3>


    <div class="row">

        <div class="col-md-9">
            <small class="">Cena v eurach: <?php echo $jedlo['Cena']; ?></small><br>

            <br>
            <?php echo $jedlo['Popis_jedla']; ?>
            <p><a class="btn btn-default" href="<?php echo site_url('/posts/'.$jedlo['wadresa']); ?>">Read More</a></p>
        </div>
    </div>

<?php endforeach; ?>

