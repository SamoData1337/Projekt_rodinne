<h2><?php echo $jedlo['Nazov_jedla']; ?></h2>
<small class="">Cena: <?php echo $jedlo['Cena']; ?> </small><br>
<div class="post-body">
    <?php echo $jedlo['Popis_jedla']; ?>

</div>

<hr>
<a class="btn btn-default pull-left" href="<?php echo base_url(); ?>posts/edit/<?php echo $jedlo['wadresa'];?>">Edit</a>
<?php echo form_open('/posts/delete/'.$jedlo['ID']); ?>
    <input type="submit"  value="Delete" class="btn btn-danger">


