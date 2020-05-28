
<?php
	$local = "localhost";
	$usuario = "root";
	$senha = "";
	$database = "vendas";
	$conectar = new mysqli($local, $usuario, $senha, $database);
	
	$stringBusca = "select * from cliente";
	
	$retornoCliente = $conectar->query($stringBusca);
	
	$listarDados = array();//array dinâmico
	while($listar = $retornoCliente->fetch_array()) {
		$listarDados[] = $listar;	
	}	
	?>
	<table>
	<th>Item</th>
	<th>Código</th>
	<th>Nome</th>
	<th>Telefone</th>
	<th>E-mail</th>
	<?php
	foreach($listarDados as $chave => $value){
		echo "<tr><td>". $chave . "</td>";		
		echo "<td>". $value["id"] . "</td>";
		echo "<td>". $value["nome"] . "</td>";
		echo "<td>". $value["telefone"] . "</td>";
		echo "<td>". $value["email"] . "</td></tr>";
	}
?>
</table>
