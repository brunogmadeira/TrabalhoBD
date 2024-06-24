<?php
include 'db_connect.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $produto = $_POST['produto'];
    $quantidade = $_POST['quantidade'];
    $status = 'Em produção';

    try {
        $sql = "SELECT inserir_dados_op(:produto, :status, :quantidade, current_timestamp)";
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(':produto', $produto);
        $stmt->bindParam(':status', $status);
        $stmt->bindParam(':quantidade', $quantidade);
        $stmt->execute();

        echo "Pedido registrado com sucesso!";
    } catch(PDOException $e) {
        echo "Erro ao registrar o pedido: " . $e->getMessage();
    }
}

$conn = null; // Fecha a conexão
?>
