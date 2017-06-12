<?php

?>
<div class="row">
    <div class="col-lg-12">
        <?php echo anchor("Objednavky/create",'Create',['class' =>'btn btn-success']); ?>
    </div>

</div>


<table style="color: #0f0f0f" class="table table-bordered table-hover ">
    <thead>
    <tr>
        <th>Specialne poziadavky_ID</th>
        <th>Typ oslavy</th>
        <th>Miesto konania</th>
        <th>Vyzdoba_ID</th>
        <th>Menu ID</th>
        <th>Operacie</th>
    </tr>
    </thead>
    <tbody>
    <?php if( count($zaznami)): ?>
        <?php foreach ($zaznami as $zaznam){ ?>
            <tr>
                <td><?php echo $zaznam->Specialne_poziadavky_ID; ?></td>
                <td><?php echo $zaznam->Typ_oslavy; ?></td>
                <td><?php echo $zaznam->Miesto_konania_ID; ?></td>
                <td><?php echo $zaznam->Vyzdoba_ID; ?></td>
                <td><?php echo $zaznam->Menu_ID; ?></td>
                <td><?php echo anchor("Objednavky/edit",'Edit',['class' =>'btn btn-default']); ?></td>
                <td><?php echo anchor("Objednavky/delete",'Delete',['class' =>'btn btn-danger']); ?></td>
            </tr>
        <?php } ?>
    <?php else: ?>
        <tr>Neboli najdene zaznamy</tr>
    <?php endif; ?>




    </tbody>




</table>
