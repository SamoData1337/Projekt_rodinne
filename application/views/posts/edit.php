<h2><?= $title; ?></h2>

<?php echo validation_errors(); ?>

<?php echo form_open('posts/update'); ?>
<input type="hidden" name="ID" value="<?php echo $jedlo['ID'];?>">
<div class="form-group">

    <label>Nazov jedla</label>

    <input type="text" class="form-control" name="nazov_jedla" placeholder="Pridaj nazov jedla" value="<?php echo $jedlo['Nazov_jedla'];?>">
</div>
<div class="form-group">
    <label>Popis jedla</label>
    <textarea class="form-control" name="Popis_jedla"> <?php echo $jedlo['Popis_jedla'];?></textarea>
</div>
<div class="form-group">
    <label>Typ jedla</label>
    <select name="typy_id" class="form-control">
        <?php foreach($typ_jedla as $typ): ?>
            <option value="<?php echo $typ['ID']; ?>"><?php echo $typ['Typ']; ?></option>
        <?php endforeach; ?>
    </select>
</div>
<div class="form-group">
    <label>Cena jedla</label>
    <input type="number" class="form-control" name="cena" placeholder="Pridaj cenu" value="<?php echo $jedlo['Cena'];?>">
</div>
<div class="form-group">
    <label>Upload Obrazok Jedla</label>
    <input type="file" name="userfile" size="20">
</div>
<button type="submit" class="btn btn-success">Pridaj</button>
</form>