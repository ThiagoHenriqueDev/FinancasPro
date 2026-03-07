-- CreateEnum
CREATE TYPE "TipoLancamento" AS ENUM ('RECEITA', 'DESPESA');

-- CreateEnum
CREATE TYPE "TipoMovimento" AS ENUM ('ENTRADA', 'SAIDA');

-- CreateEnum
CREATE TYPE "StatusLancamento" AS ENUM ('PENDENTE', 'VENCIDO', 'PARCIAL', 'PAGO', 'CANCELADO');

-- CreateEnum
CREATE TYPE "OrigemMovimento" AS ENUM ('BAIXA', 'AJUSTE', 'DEPOSITO', 'TRANSFERENCIA');

-- CreateTable
CREATE TABLE "DocumentoFinanceiro" (
    "id" TEXT NOT NULL,
    "numeroDocumento" TEXT NOT NULL,
    "descricao" TEXT NOT NULL,
    "tipo" "TipoLancamento" NOT NULL,
    "valorTotal" DOUBLE PRECISION NOT NULL,
    "dataEmissao" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "DocumentoFinanceiro_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Lancamento" (
    "id" TEXT NOT NULL,
    "valorParcela" DOUBLE PRECISION NOT NULL,
    "valorPago" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "valorDesconto" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "valorJuros" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "valorMulta" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "dataVencimento" TIMESTAMP(3) NOT NULL,
    "numeroParcela" INTEGER NOT NULL,
    "totalParcelas" INTEGER NOT NULL,
    "status" "StatusLancamento" NOT NULL,
    "planoContaId" TEXT NOT NULL,
    "documentoFinanceiroId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Lancamento_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Baixa" (
    "id" TEXT NOT NULL,
    "dataBaixa" TIMESTAMP(3) NOT NULL,
    "valorPago" DOUBLE PRECISION NOT NULL,
    "valorDesconto" DOUBLE PRECISION NOT NULL,
    "valorJuros" DOUBLE PRECISION NOT NULL,
    "valorMulta" DOUBLE PRECISION NOT NULL,
    "contaId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Baixa_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BaixaLancamento" (
    "id" TEXT NOT NULL,
    "valorAplicado" DOUBLE PRECISION NOT NULL,
    "baixaId" TEXT NOT NULL,
    "lancamentoId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "BaixaLancamento_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PlanoConta" (
    "id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "numero" TEXT NOT NULL,
    "tipo" "TipoLancamento" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PlanoConta_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ContaFinanceira" (
    "id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "numero" TEXT NOT NULL,
    "saldoInicial" DOUBLE PRECISION NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ContaFinanceira_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MovimentoConta" (
    "id" TEXT NOT NULL,
    "descricao" TEXT NOT NULL,
    "tipo" "TipoMovimento" NOT NULL,
    "origem" "OrigemMovimento" NOT NULL,
    "valor" DOUBLE PRECISION NOT NULL,
    "dataMovimento" TIMESTAMP(3) NOT NULL,
    "contaId" TEXT NOT NULL,
    "baixaId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "MovimentoConta_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "Lancamento_dataVencimento_idx" ON "Lancamento"("dataVencimento");

-- CreateIndex
CREATE INDEX "Lancamento_status_idx" ON "Lancamento"("status");

-- CreateIndex
CREATE UNIQUE INDEX "BaixaLancamento_baixaId_lancamentoId_key" ON "BaixaLancamento"("baixaId", "lancamentoId");

-- CreateIndex
CREATE INDEX "MovimentoConta_dataMovimento_idx" ON "MovimentoConta"("dataMovimento");

-- CreateIndex
CREATE INDEX "MovimentoConta_contaId_idx" ON "MovimentoConta"("contaId");

-- AddForeignKey
ALTER TABLE "Lancamento" ADD CONSTRAINT "Lancamento_planoContaId_fkey" FOREIGN KEY ("planoContaId") REFERENCES "PlanoConta"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Lancamento" ADD CONSTRAINT "Lancamento_documentoFinanceiroId_fkey" FOREIGN KEY ("documentoFinanceiroId") REFERENCES "DocumentoFinanceiro"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Baixa" ADD CONSTRAINT "Baixa_contaId_fkey" FOREIGN KEY ("contaId") REFERENCES "ContaFinanceira"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BaixaLancamento" ADD CONSTRAINT "BaixaLancamento_baixaId_fkey" FOREIGN KEY ("baixaId") REFERENCES "Baixa"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BaixaLancamento" ADD CONSTRAINT "BaixaLancamento_lancamentoId_fkey" FOREIGN KEY ("lancamentoId") REFERENCES "Lancamento"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MovimentoConta" ADD CONSTRAINT "MovimentoConta_contaId_fkey" FOREIGN KEY ("contaId") REFERENCES "ContaFinanceira"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MovimentoConta" ADD CONSTRAINT "MovimentoConta_baixaId_fkey" FOREIGN KEY ("baixaId") REFERENCES "Baixa"("id") ON DELETE SET NULL ON UPDATE CASCADE;
