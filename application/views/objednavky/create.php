<h2>Nova objednavka</h2>

<?php echo validation_errors(); ?>

<?php echo form_open_multipart('objednavky/create'); ?>
<div class="form-group">
    <label>Specialne poziadavky</label>
    <select name="miesto_konania" class="form-control">
        <?php foreach($specialne as $spec): ?>
            <option value="<?php echo $spec['ID']; ?>"><?php echo $spec['Poziadavka']; ?></option>
        <?php endforeach; ?>
    </select>
</div>
<div class="form-group">
    <label>Typ oslavy</label>
    <textarea class="form-control" name="typos" placeholder="Pridaj typ oslavy"></textarea>
</div>
<div class="form-group">
    <label>Miesto konania</label>
    <select name="miesto_konania" class="form-control">
        <?php foreach($miesta as $miesto): ?>
            <option value="<?php echo $miesto['ID']; ?>"><?php echo $miesto['Mesto']; ?></option>
        <?php endforeach; ?>
    </select>
</div>
<div class="form-group">
    <label>Vyzdoba</label>
    <select name="vyzdoba" class="form-control">
        <?php foreach($vyzdoba as $vyz): ?>
            <option value="<?php echo $vyz['ID']; ?>"><?php echo $vyz['Typ_vyzdoby_ID']; ?></option>
        <?php endforeach; ?>
    </select>
</div>
<div class="form-group">
    <label>Menu</label>
    <select name="miesto_konania" class="form-control">
        <?php foreach($menu as $me): ?>
            <option value="<?php echo $me['ID']; ?>"><?php echo $me['ID']; ?></option>
        <?php endforeach; ?>
    </select>
</div>

<button type="submit" class="btn btn-success">Pridaj</button>
</form>