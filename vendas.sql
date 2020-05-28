-- -----------------------------------------------------
-- Table `vendas`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Rendas`.`cliente` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NULL,
  `email` VARCHAR(80) NULL,
  `telefone` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
COMMENT = 'Armazenar dados.';


-- -----------------------------------------------------
-- Table `vendas`.`produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS 'vendas`.`produto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `descricao` LONGTEXT NULL,
  `quantidade` INT NULL,
  `precoVenda` DECIMAL(10,2) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
COMMENT = 'Armazenar dados dos produtos';


-- -----------------------------------------------------
-- Table `vendas`.`vendedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendas`.`vendedor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `salarioFixo` DECIMAL(10,2) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table 'vendas`.`venda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendas`.`venda` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `dataVenda` TIMESTAMP NULL,
  `notaFiscal` VARCHAR(45) NULL,
  `valorTotal` DECIMAL(10,2) NULL,
  `cliente_id` INT NOT NULL,
  `vendedor_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_venda_cliente_idx` (`cliente_id` ASC),
  INDEX `fk_venda_vendedor1_idx` (`vendedor_id` ASC),
  CONSTRAINT `fk_venda_cliente`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `vendas`.`cliente` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_venda_vendedor1`
    FOREIGN KEY (`vendedor_id`)
    REFERENCES `vendas`.`vendedor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Armazenar dados da venda';


-- -----------------------------------------------------
-- Table 'vendas`.`itensVenda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendas`.`itensVenda` (
  `produto_id` INT NOT NULL,
  `venda_id` INT NOT NULL,
  `quantidade` INT NULL,
  `precoVenda` DECIMAL(10,2) NULL,
  PRIMARY KEY (`produto_id`, `venda_id`),
  INDEX `fk_produto_has_venda_venda1_idx` (`venda_id` ASC),
  INDEX `fk_produto_has_venda_produto1_idx` (`produto_id` ASC),
  CONSTRAINT `fk_produto_has_venda_produto1`
    FOREIGN KEY (`produto_id`)
    REFERENCES `vendas`.`produto` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_produto_has_venda_venda1`
    FOREIGN KEY (`venda_id`)
    REFERENCES `vendas`.`venda` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB
COMMENT = 'Armazenar produtos da venda';


-- -----------------------------------------------------
-- Table `vendas`.`fornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendas`.`fornecedor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `empresa` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `telefone` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
