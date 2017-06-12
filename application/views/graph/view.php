<html>
<head>
    <title>jQuery Ajax tutorial using Code Igniter Framework</title>
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript" src="<?php print base_url(); ?>/js/jqbargraph.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var arrayOfPHPData = <?php echo json_encode($year_graph) ?>;
            arrayOfDataJS = new Array();
            $.each(arrayOfPHPData, function (i, elem) {
                arrayOfDataJS[i] = [parseInt(elem['count']),parseInt(elem['year'])];
            });
            console.log(arrayOfDataJS);
            $('#divForGraph').jqBarGraph({
                data: arrayOfDataJS,
                title: "This is the title and <strong>Bold</strong> is working",
                barSpace: 20,
                postfix: 'Year',
            });
        });
    </script>
</head>

<body>

<div id="wrapper">

    <div id="divForGraph"></div>

</div>

</body>
</html>