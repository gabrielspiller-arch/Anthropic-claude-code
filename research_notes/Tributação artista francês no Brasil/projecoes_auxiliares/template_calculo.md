# Memória de cálculo: projeções tributárias do artista plástico francês residente no Brasil (PF × PJ)

> **Ano-base 2027**, primeiro ano com CBS. Há comparação com 2026 e um quadro ilustrativo de 2033. Os parâmetros estão vigentes ou publicados até **19/11/2026** e vêm das notas desta pasta.
> **Modelo:** `projecoes_modelo.py` (Python 3 puro, determinístico). Para reproduzir: `python3 -I projecoes_modelo.py`. Todas as tabelas abaixo são saída literal do script, em reais inteiros.
> **Conferência:** 71 de 71 verificações conferem com os exemplos numéricos das notas (seção 17).
> **Rótulos de status:**
> - [REGRA EXPRESSA]
> - [CÁLCULO TCU-PENDENTE]
> - [ESTIMATIVA]
> - [INTERPRETAÇÃO]
> - [PREMISSA DO CASO]
> - [PONTO NÃO RESOLVIDO], quando a própria lei deixa a questão em aberto.

---

## 0. Resumo para a reunião

Números de 2027, com vendas internas a partir de SP e margem de 60% (caso central). Na hipótese A, o IBS/CBS é repassado ao comprador; na hipótese B, o preço total fica em R$ 4 milhões. A CBS de 11,2% depende da resolução do Senado [CÁLCULO TCU-PENDENTE].

**1. A PJ no lucro presumido comercial é a estrutura mais eficiente no caso-base a partir de ~31% de margem.**
- Valor líquido ao sócio:
  - A: R$ 1.393.225
  - B: R$ 1.152.292
- PF (SP, alíquota cheia):
  - A: R$ 1.214.157
  - B: R$ 1.012.498
- Lucro real:
  - A: R$ 1.114.344
  - B: R$ 930.684
- A vantagem do presumido vem da base presumida de 8%/12%. O IRPJ e a CSLL somam R$ 99.200, contra ~34% do lucro no real e 27,5% marginais na PF.
- Os dividendos pagam o IRPFM de ~10% (R$ 143.832), sem redutor, porque t_PJ = 6,37%.

**2. O IBS/CBS é neutro para o resultado do artista quando repassado (A). Quando absorvido (B), custa ~R$ 240 mil/ano no caso central.**
- Em A o comprador paga R$ 4.370.640 em vez de R$ 4.000.000.
- Em B a receita R cai para R$ 3.660.791, pela fórmula R = P/[1 + t(1 − a)].
- A proporção C_cred/C (20%, 50% ou 80%) **não altera** o líquido enquanto os créditos forem integralmente aproveitáveis. Altera só o recolhimento líquido e o caixa (seção 10, S1).

**3. Lucro real × presumido.**
- O real só empata ou supera com margens baixas:
  - ~30,1% (A)
  - ~36,3% (B)
  - ~12,1% com 100% de exportação
- Acima dessas margens, o presumido ganha.
- O ponto de 9,06% indicado na nota de PJ é trimestral, sem pró-labore e sem dividendos (seção 17).

**4. PF × PJ depende de uma leitura não resolvida do IRPFM da PF [PONTO NÃO RESOLVIDO].**
- Leitura literal: a base do IRPFM é a receita bruta, porque o livro-caixa não está entre as deduções do art. 16-A, § 1º. Nessa leitura a PF nunca supera o presumido, e com margem de 30% o IRPFM da PF chega a R$ 284.499.
- Leitura favorável: a base é o rendimento líquido do livro-caixa. Nessa leitura a PF empata com o presumido em ~30,6% de margem, e abaixo disso é ligeiramente melhor.
- Com margem ≥ 60% as duas leituras dão IRPFM zero, porque o IRPF progressivo (~27%) já supera 10% da receita bruta.

**5. Estado e encomendas podem mudar a conclusão.**
- PF autora em UF com isenção do autor (MG, RS ou BA, com estabelecimento efetivo) líquido: R$ 1.736.157 (A, 60%).
  - Supera todas as estruturas paulistas.
  - Em MG a isenção exige obra "sem utilização de trabalho assalariado", o que provavelmente a torna inaplicável com 5 colaboradores.
  - PJ não tem a isenção em nenhuma UF.
- PJ de serviços (encomendas, item 40.01, ISS no lugar do ICMS):
  - R$ 1.580.425 com ISS 5%.
  - R$ 1.688.425 com ISS 2%.
  - Ressalvas: a alíquota de SP para o 40.01 não foi confirmada, e a SEFAZ-SP sustenta ICMS quando há circulação posterior (risco de dupla exigência).

**6. Exportação.**
- Com 100% de exportação, o líquido no presumido sobe para R$ 2.041.225 (A ou B, 60%), sem ICMS nem IBS/CBS.
- Os créditos de IBS/CBS (R$ 90.400) ficam a ressarcir.

**7. Redução de 60% do art. 139.** Vale se Mathias for brasileiro nato ou naturalizado; como francês, a alíquota é cheia.
- Em A não muda o resultado do artista. O comprador paga R$ 222.384 a menos.
- Em B aumenta o líquido:
  - +R$ 139.393/ano na PJ
  - +R$ 116.672/ano na PF

**8. Integralização de R$ 2 milhões a valor de mercado não é neutra.**
- No presumido piora o resultado (−R$ 156.168 a 60%; −R$ 44.291 a 90%).
- Motivo: troca o IRPFM de até 10%, diferido e sujeito a redutor, por ganho de capital de 15%, imediato.
- No real melhora (+R$ 221.913 a 60%), mas fica abaixo do presumido com aporte pelo custo. O risco é alto: requalificação, glosa e arbitramento do valor.

**9. Crédito de estoque.**
- Importar o lote de VA R$ 1 milhão em dez/2026 ou em jan/2027 dá o mesmo custo final, R$ 36.000 de II, se o crédito presumido de estoque for aceito.
- A importação de 2026 imobiliza caixa por mais tempo (R$ 153.500 durante 2027) e depende da tese de "bens novos".
- Se o crédito de estoque for glosado, ou se a PJ só exportar, perdem-se R$ 117.500.

**10. Empresa francesa mantida (por € 100 de lucro).**
- Carga de 36,25 (disponibilização) ou 34,60 (regime anual).
- Pode chegar a 42,10 se o IRPFM incidir sem crédito do imposto estrangeiro [PONTO NÃO RESOLVIDO].
- A PJ brasileira holding chega a 42,62.

---

## 1. Definições (usadas de forma consistente)

| Símbolo | Definição |
|---|---|
| **R** | Receita anual **antes** dos tributos cobrados "por fora" (IBS/CBS), **incluindo** os "por dentro": ICMS, ISS e, em 2026, PIS/Cofins. Caso-base: R = R$ 4.000.000, igual nos 4 trimestres e nos 12 meses. |
| **a** | Alíquota do ICMS (ou do ISS) sobre R nas vendas internas. A exportação não tem ICMS (CF, art. 155, § 2º, X, "a") nem ISS (LC 116, art. 2º, I). |
| **t** | IBS + CBS "por fora". Em 2027: t = (11,3% − 0,1 p.p.) + 0,1% = **11,3%** (CBS 11,2% + IBS 0,1%). Com a redução do art. 139: 0,4 × t = 4,52%. |
| **Base do IBS/CBS** | R − ICMS − ISS (LC 214, art. 12, § 2º, V, de 2026 a 2032). **Conferido**: o inciso V exclui ICMS, ISS e PIS/Cofins; o inciso I exclui o próprio IBS/CBS. |
| **Preço pago pelo comprador (P)** | P = R + IBS + CBS = R + t × (R − aR) = R × [1 + t(1 − a)] (vendas internas); P = R na exportação. |
| **Hipótese A** | Repasse integral: R = 4.000.000 constante; o comprador paga P > R. |
| **Hipótese B** | Preço final mantido: P = 4.000.000 (o que o comprador pagaria em 2026, quando o IBS/CBS-teste é dispensado). Logo **R = P / [1 + t(1 − a)]**. A fórmula pedida **confere** com a regra de base enquanto o ICMS incidir só sobre R. Na posição da SEFAZ-SP (IBS/CBS na base do ICMS), ICMS = aR(1+t)/(1+at), e o modelo resolve R numericamente (sensibilidade S2). |
| **m** | Margem operacional = (R − C)/R, com R = 4.000.000. |
| **C** | Custos e despesas operacionais **antes** dos tributos sobre o consumo líquidos, dos tributos sobre a renda e de qualquer remuneração do artista. Medido **líquido** de IBS/CBS recuperáveis. **C = (1 − m) × 4.000.000, fixo em reais nas hipóteses A e B** [PREMISSA/INTERPRETAÇÃO]. Em B a margem efetiva cai. |
| **C_cred** | Parte de C que gera crédito de IBS/CBS: materiais, molduras, aluguel de ateliê a locador contribuinte, fretes, serviços e comissões de PJ. Caso-base: 50% de C; sensibilidade com 20% e 80%. Crédito = t_cheia × C_cred, porque os fornecedores cobram alíquota cheia mesmo quando a saída do artista é reduzida. |
| **C_nc** | Parte de C sem crédito: salários e encargos dos ~5 colaboradores, inclusive o INSS patronal. O trabalho do artista nunca entra em C. |
| **L0** | **Lucro antes dos tributos sobre a renda e da remuneração do artista** = R − C − tributos sobre consumo absorvidos (ICMS/ISS; PIS/Cofins em 2026; créditos perdidos no Simples; CBS do DAS). É a base da "carga sobre o lucro". |
| **(3) Lucro contábil** | PJ: L0 − pró-labore − CPP − CMV adicional (integralização), **antes** de IRPJ/CSLL. É o "lucro contábil" do art. 16-B, § 3º, III, da Lei 9.250. PF: não há lucro contábil; as tabelas mostram L0 (resultado do livro-caixa antes do INSS). |
| **(4) Caixa disponível** | PJ: caixa após tributos da PJ e pró-labore, antes da distribuição. É o lucro distribuível; o CMV não caixa da integralização não o reduz. PF: caixa após IRPF, INSS e IRPFM. |
| **(5) Líquido ao artista/sócio** | PF: L0 − INSS − IRPF − IRPFM. PJ: pró-labore − INSS 11% − IRPF do pró-labore + dividendos + redução de capital − IRPFM final − ganho de capital. O IRRF de 10% sobre dividendos é **antecipação**: o líquido considera o imposto final, e o saldo da declaração aparece à parte. |
| **(6a) Carga s/ R** | Tributos **suportados** ÷ R. Inclui ICMS/ISS, PIS/Cofins, IBS/CBS não recuperado, IRPJ, CSLL, CPP, INSS do artista, IRPF, IRPFM e ganho de capital. Exclui o IBS/CBS repassado e o INSS patronal dos empregados (está em C_nc). |
| **(6b) Carga s/ preço** | Os mesmos tributos ÷ P (valor pago pelo comprador). |
| **(6c) Carga c/ IBS-CBS s/ preço** | (Tributos suportados + IBS/CBS **destacado**) ÷ P. É a fatia do preço pago que vai para tributos nesta etapa. |
| **(6d) Carga s/ lucro** | (Tributos sobre a renda + INSS/CPP do artista) ÷ L0. |

**Regra de bases:** nenhum percentual é somado a outro de base diferente. Toda carga é recalculada em reais e dividida pela base indicada na coluna. Exemplo: 15% de IRPJ sobre 8% de R equivale a 1,2% de R, e não a "15% + 8%".

---

## 2. Parâmetros (fonte e status)

| Parâmetro | Valor | Dispositivo / fonte (nota) | Status |
|---|---|---|---|
| Receita anual R (A) / preço P (B) | 4.000.000 | caso | [PREMISSA DO CASO] |
| Margens m | 30%, 60%, 90% | caso | [PREMISSA DO CASO] |
| C_cred / C | 50% (sens. 20%, 80%) | caso | [PREMISSA DO CASO] |
| Alíquota de referência da CBS 2027 | 11,3% (calc. 11,3468%) | Ac. TCU 2.933/2026-Plenário; LC 214 arts. 349 (§§ 2º e 14) e 353 § 2º; Senado até 15/12/2026, sem resolução em 19/11/2026 (nota de alíquotas §1) | [CÁLCULO TCU-PENDENTE] |
| CBS cobrada 2027 | 11,2% (= ref. − 0,1 p.p.) | ADCT art. 127, p.ú.; LC 214 art. 347 | [REGRA EXPRESSA] sobre valor pendente |
| IBS 2027 | 0,1% (0,05% UF + 0,05% mun.) | ADCT art. 127; LC 214 art. 344 | [REGRA EXPRESSA] |
| CBS/IBS 2026 | 0,9%/0,1%, dispensados; modelados como zero | LC 214 arts. 343, 346, 348 § 1º; PF sem CNPJ/documento até 2027 (Dec. 12.955 arts. 105 § 4º-A, 115 § 3º) | [REGRA EXPRESSA] + [INTERPRETAÇÃO] |
| Base IBS/CBS | exclui IBS/CBS, ICMS, ISS, PIS/Cofins (2026-2032) | LC 214 art. 12, § 2º, I e V | [REGRA EXPRESSA] |
| Redução art. 139 | 60% (só obras de "artistas brasileiros") | LC 214 art. 139, VIII e § 3º; Anexo X itens 43-45; Dec. 12.955 art. 215 § 3º | [REGRA EXPRESSA]; conceito [PONTO NÃO RESOLVIDO] |
| CBS ref. alternativa | 9,3%; 10,0% | hiato de conformidade (nota de alíquotas §1) | [ESTIMATIVA] |
| CBS+IBS 2033 | 26,5%; 28% | 26,5% = gatilho do art. 475 § 11 da LC 214, não teto; 28% = estimativa da Fazenda pós-emendas, não reverificada | [ESTIMATIVA] |
| ICMS SP interno | 18% "por dentro"; sem isenção do autor desde 1º/1/2025 | RICMS/SP art. 52, I; Anexo I art. 128 § 2º (Dec. 67.383/2022); RC 32.371/2025 | [REGRA EXPRESSA] |
| ICMS em UF com isenção do autor | 0% (só PF autora, estabelecimento efetivo) | MG RICMS/2023 Anexo X item 39 ("sem utilização de trabalho assalariado"); RS art. 9º XXXII; BA art. 265 XXVIII | [REGRA EXPRESSA estadual]; aplicabilidade [INTERPRETAÇÃO] |
| ICMS sobre IBS/CBS | caso-base não; sensibilidade sim | LC 87 art. 13 silente; SEFAZ-SP RCs 32.303/2025, 32.931/2025, 33.083/2026 | [INTERPRETAÇÃO] / posição administrativa SP |
| ISS 40.01 | 5% (conservador); 2% (sens.) | LC 116 arts. 8º II e 8º-A; alíquota SP **não confirmada** | [REGRA EXPRESSA] (limites) |
| PIS/Cofins 2026 | 3,65% cumulativo (presumido); 9,25% não cumulativo (real) | Lei 9.718; Leis 10.637/10.833; isenção na exportação (MP 2.158-35 art. 14) | [REGRA EXPRESSA] |
| ICMS fora da base PIS/Cofins | sim | STF Tema 69 (RE 574.706). **Fora das notas** (conhecimento geral) | [INTERPRETAÇÃO] |
| IRPJ / adicional / CSLL | 15% / 10% > 20 mil/mês / 9% | Lei 9.249 art. 3º; Lei 7.689 art. 3º III | [REGRA EXPRESSA] |
| Presunção comércio | 8% IRPJ / 12% CSLL | Lei 9.249 arts. 15 e 20, III; obra própria em estoque = venda (nota PJ §1) | [REGRA EXPRESSA] + [INTERPRETAÇÃO] forte |
| Presunção serviços | 32% / 32% | Lei 9.249 art. 15 § 1º III; art. 20 I; encomenda 40.01 = serviço | [REGRA EXPRESSA] + [INTERPRETAÇÃO] |
| LC 224 | +10% nos percentuais só sobre receita > 5 mi/ano (não aciona) | LC 224 art. 4º §§ 4º VII e 5º; IN RFB 2.305 art. 15 | [REGRA EXPRESSA] |
| Teto INSS | 8.475,55/mês (2026); usado em 2027 | Port. Interm. MPS/MF 13/2026; teto 2027 não publicado | [REGRA EXPRESSA] 2026 / [ESTIMATIVA] 2027 |
| INSS CI / sócio / CPP | 20% / 11% / 20% (sem teto) | Lei 8.212 arts. 21, 30 § 4º, 22 III | [REGRA EXPRESSA] |
| Pró-labore | 8.475,55/mês (teto) | caso | [PREMISSA DO CASO] |
| Tabela IRPF anual | 0 / 7,5 / 15 / 22,5 / 27,5% (parcela 10.904,66); simplificado 20% até 17.640; redução art. 11-A | Lei 15.191/2025; Lei 9.250 arts. 10 e 11-A; mantida em 2027 por falta de lei nova | [REGRA EXPRESSA] + [INTERPRETAÇÃO] |
| IRRF dividendos | 10% sobre o **total** do mês se > 50.000 (por PJ/sócio) | Lei 9.250 art. 6º-A; IN RFB 2.299/2025 | [REGRA EXPRESSA] |
| IRPFM | 0 até 600 mil; (REND/60.000 − 10)% até 1,2 mi; 10% acima | Lei 9.250 art. 16-A | [REGRA EXPRESSA] |
| Redutor | D × max(0; t_PJ + t_PF − 34%) | Lei 9.250 art. 16-B; sem IN | [REGRA EXPRESSA]; cálculo de t_PF [INTERPRETAÇÃO] |
| Ganho de capital PF | 15% (≤ 5 mi); 17,5%; 20%; 22,5% | Lei 8.981 art. 21 | [REGRA EXPRESSA] |
| Simples 6ª faixa 2027 | Anexo I 18,90% (−378.000) → ef. 9,45%; Anexo III 32,90% (−648.000) → ef. 16,70% | LC 214 art. 519, Anexos XVIII e XX | [REGRA EXPRESSA]; vedado (LC 123 arts. 3º § 4º, 17 II) |
| Importação 9701.91.00 | II 3,6% (UE: 2,4% em 2027, não verificado); PIS/Cofins-Imp. 11,75%; ICMS 18% por dentro | TEC; Lei 10.865 art. 8º; LC 87 art. 13 V; LC 214 arts. 63-78 | [REGRA EXPRESSA] / [ESTIMATIVA] (UE) |
| Crédito de estoque | = PIS/Cofins-Imp. pago; 12 parcelas; só CBS; sem ressarcimento | LC 214 art. 381 §§ 3º-4º; Dec. 12.955 arts. 605-613 | [REGRA EXPRESSA]; "bem novo" [PONTO NÃO RESOLVIDO] |
| Taxa financeira ilustrativa | 1% a.m. | não pesquisada | [ESTIMATIVA] |
| França | IS 25%; retenção PF não residente 12,8% (tratado: teto 15%); PJ não residente 15%; IR Brasil 15% com crédito | CGI arts. 219, 187; Dec. 70.506 art. X; Lei 14.754 arts. 5º-6º-A | [REGRA EXPRESSA] (FR via nota, não verificado no original) |

---

## 3. Fórmulas

### 3.1 Tributos sobre o consumo (por ano)
- **ICMS (vendas internas)** = a × R_dom. Na sensibilidade SP: a × R_dom × (1 + t)/(1 + a·t).
- **ISS** = a_ISS × R_dom.
- **IBS/CBS destacado (débito)** = t × (R_dom − ICMS − ISS). Exportação: zero (imune; LC 214 art. 8º/79), com manutenção dos créditos.
- **Créditos** = t × C_cred. **Recolhido líquido** = débito − créditos. Valor negativo é saldo credor a ressarcir (LC 214 art. 39: 30/60/180 dias).
- **2026:** sem IBS/CBS, por causa da dispensa.
  - PIS/Cofins presumido = 3,65% × (R_dom − ICMS).
  - PIS/Cofins real = 9,25% × (R_dom − ICMS) − 9,25% × C_cred.
  - Exportação isenta.
- **Na hipótese A o IBS/CBS não afeta o lucro**, porque o comprador o paga e os créditos sobre C_cred estão fora de C. Na hipótese B ele reduz R.

### 3.2 PF (cenário 1)
- INSS contribuinte individual = 20% × teto × 12 = **20.341,32**.
- Base do IRPF = R − ICMS − C × (1 − glosa) − INSS.
  - A glosa é 0 no caso-base.
  - O livro-caixa abrange salários e encargos, custeio e o ICMS pago.
  - O INSS é dedutível na DAA completa.
  - O desconto simplificado não compensa com essa receita.
- IRPF = 27,5% × base − 10.904,66. Não há redução, porque o rendimento tributável passa de 88.200.
- **IBS/CBS no IRPF** [INTERPRETAÇÃO]: o rendimento é medido líquido do IBS/CBS cobrado por fora. No caixa, os recebimentos são R + débito e os pagamentos são o IBS/CBS ao fisco e aos fornecedores, de modo que o resultado é R − C.
- IRPFM = max(0; a(REND) × REND − IRPF devido):
  - **"bruta"** (caso-base conservador): REND = R (receita bruta), porque o livro-caixa não está entre as deduções taxativas do art. 16-A, § 1º;
  - **"líquida"**: REND = R − ICMS − C;
  - [PONTO NÃO RESOLVIDO].
- **Limitações do livro-caixa** (Lei 8.134 art. 6º; RIR arts. 68-69; IN 1.500 art. 104):
  - indedutíveis: depreciação, arrendamento, "locomoção e transporte" (os fretes de obras são um risco) e bens de capital;
  - o excesso de deduções **não passa para o ano seguinte**, e não há "estoque": a produção de um ano vendida no outro perde despesas;
  - ateliê na residência: 1/5 das despesas se não houver prova;
  - as deduções só valem a partir da residência (IN SRF 208 art. 7º).
  - A sensibilidade S4 aplica uma glosa de 10% de C.

### 3.3 PJ lucro presumido (cenários 2 e 3)
- Base IRPJ = p_IRPJ × R. Base CSLL = p_CSLL × R. R inclui ICMS/ISS (DL 1.598 art. 12 § 5º) e exclui IBS/CBS (art. 12 § 4º) [INTERPRETAÇÃO forte].
- IRPJ por trimestre = 15% × B_trim + 10% × max(0; B_trim − 60.000), × 4 trimestres. CSLL = 9% × base.
- Pró-labore PL = 12 × 8.475,55 = 101.706,60; CPP = 20% × PL; INSS do sócio = 11% × PL (no teto).
- Lucro contábil LC = L0 − PL − CPP. Distribuição D = LC − IRPJ − CSLL, em 12 parcelas iguais.
  - Exige escrituração contábil completa para distribuir acima da base presumida (IN 1.700 art. 238 § 2º, II).
- IRPF sobre o pró-labore (DAA) = menor entre o simplificado (12.213,65) e o completo.

### 3.4 PJ lucro real (cenário 4)
- Lucro real = LC, sem adições ou exclusões. O pró-labore e a CPP são dedutíveis (RIR art. 368).
- IRPJ = 15% × LC + 10% × max(0; LC − 240.000); CSLL = 9% × LC.
- O IBS/CBS é igual ao do presumido. A compensação de prejuízos não foi modelada.

### 3.5 Dividendos (Lei 15.270/2025)
- **IRRF** = 10% × D_mês, se D_mês > 50.000 (sobre o total); × 12.
- **IRPFM**:
  - REND = D + pró-labore (+ outros);
  - a = 0, (REND/60.000 − 10)% ou 10%;
  - IRPFM_pré = max(0; a × REND − IRPF devido na DAA).
- **Redutor**:
  - t_PJ = (IRPJ + CSLL)/LC;
  - t_PF = [IRPFM_pré(com D) − IRPFM_pré(sem D)]/D;
  - redutor = D × max(0; t_PJ + t_PF − 34%);
  - IRPFM = max(0; IRPFM_pré − redutor).
- **Saldo da DAA** = IRPFM − IRRF (negativo = restituição).
- [INTERPRETAÇÃO]: t_PF líquido do IRPF da DAA; lucro contábil societário completo, e não o simplificado do § 6º, que daria t_PJ menor; sem IN do redutor.

### 3.6 Simples (cenário 5: só ilustrativo, juridicamente vedado)
- DAS = alíquota efetiva × R. Repartição 2027:
  - Anexo I: IRPJ 13,58%, CSLL 10,06%, CBS 34,02%, CPP 42,34%;
  - Anexo III: IRPJ 35,09%, CSLL 15,04%, CBS 19,29%, CPP 30,58%.
- ICMS e IBS por fora, porque a receita passa do sublimite de R$ 3,6 milhões.
- Sem crédito de IBS/CBS sobre C_cred: a perda entra como tributo absorvido.
- CPP no DAS, logo sem os 20% sobre o pró-labore.
- t_PJ = parcela IRPJ+CSLL do DAS ÷ LC [PONTO NÃO RESOLVIDO].
- Dividendos tributados conforme a RFB (P&R Q10), posição contestada nas ADIs 7.912, 7.914 e 7.917.
- Simplificação: o C_nc não foi reduzido pela CPP dos empregados incluída no DAS, o que superestima levemente o custo do Simples.

---

## 4. Cenário-modelo passo a passo: PJ presumido comercial, m = 60%, hipótese A, 2027

{{SEC:M.}}

Leitura:
- O comprador paga R$ 4.370.640, dos quais R$ 370.640 são IBS/CBS. A PJ recolhe R$ 280.240 líquidos; os outros R$ 90.400 já foram pagos pelos fornecedores e entraram como crédito.
- Dos R$ 4.000.000 de R:
  - C absorve R$ 1.600.000;
  - os tributos suportados somam R$ 1.006.775 (ICMS R$ 720.000 = 71,5% deles);
  - o sócio recebe R$ 1.393.225 líquidos.
- O IRRF mensal (R$ 145.875 no ano) supera o IRPFM final (R$ 143.832). A diferença vem do IRPF do pró-labore, dedutível do IRPFM, e gera restituição de R$ 2.043 na DAA de 2028.
- Há também ajuste do IRPF do pró-labore: o IRRF retido (13.987,92) excede o devido (12.213,65).

---

## 5. Tabelas comparativas 2027, vendas internas (seis medidas por cenário)

Sobre as linhas da tabela:
- "1'" é a PF em UF com isenção do autor. Exige estabelecimento efetivo na UF, e em MG exige obra sem trabalho assalariado, o que provavelmente a torna inaplicável.
- "3/3'" é a PJ de serviços (encomendas e licenciamento), com ISS 5% ou 2%. A alíquota de SP para o 40.01 não foi confirmada.
- O Simples é **juridicamente vedado** na estrutura provável: sócio domiciliado no exterior (LC 123 art. 17, II), PJ sócia (art. 3º § 4º, I) ou participação/administração em outra empresa com receita global acima de R$ 4,8 milhões (art. 3º § 4º, IV-V). Aparece só em A, como ilustração.
- PF e IRPFM: as tabelas T-A e T-B usam a leitura literal ("bruta"); a tabela T-PF mostra as duas leituras.

{{SEC:T-A-30.}}

{{SEC:T-A-60.}}

{{SEC:T-A-90.}}

{{SEC:T-B-30.}}

{{SEC:T-B-60.}}

{{SEC:T-B-90.}}

{{NOTAS}}

Observações:
- Na hipótese B com m = 30% a margem efetiva praticamente desaparece. A PF (leitura "bruta") e o presumido ficam com caixa negativo, porque C é fixo em reais e o IBS/CBS absorvido (~R$ 339 mil) consome o lucro.
- **O IRPFM da PF é zero com margem ≥ 60% nas duas leituras.** O IRPF progressivo (27,5% marginal) já supera 10% da receita bruta, como se pedia verificar.
- Com 30% de margem, a leitura literal gera IRPFM de R$ 284.499 (A).

{{SEC:T-PF.}}

{{SEC:T-DIV.}}

Leitura do redutor:
- No presumido comercial t_PJ é baixo (3,6% a 6,4% nas margens de 60% e 90%), e o IRPFM de 10% incide pleno. O IRRF só antecipa.
- No real (t_PJ ≈ 32-33%) o redutor neutraliza quase todo o IRPFM, e a carga combinada fica em ~34% do lucro.
- No presumido de serviços com 30% de margem, t_PJ = 46,8%, mas o rendimento fica abaixo de R$ 600 mil, e o IRPFM é zero de qualquer modo.

---

## 6. Exportação (cenário 6)

Regras aplicadas:
- Sem ICMS.
- IBS/CBS imunes, com manutenção e ressarcimento dos créditos (LC 214 arts. 79 e 39). A comprovação da exportação deve ocorrer em 180 dias (art. 81-A).
- IRPJ, CSLL e IRPF normais.
- Em 2026, PIS/Cofins isentos.

O IBS/CBS negativo é saldo credor a ressarcir. O líquido supõe ressarcimento no próprio ano, mas há prazo de 30, 60 ou 180 dias.

{{SEC:X.}}

{{NOTAS}}

---

## 7. Redução de 60% do art. 139 (cenário 7)

**Como francês, Mathias paga a alíquota cheia.** A redução vale só para obras "produzidas por artistas brasileiros" (§ 3º), lidas como de autor brasileiro **nato ou naturalizado**, independentemente de residência [INTERPRETAÇÃO DEFENSÁVEL; nota art. 139].

Pontos abertos:
- Obras produzidas antes de uma naturalização [PONTO NÃO RESOLVIDO].
- A tese de não discriminação do tratado (art. XXIV), que só serviria à PF [PONTO NÃO RESOLVIDO].

Com a redução, a alíquota passa a 4,48% de CBS + 0,04% de IBS = 4,52%. Os créditos sobre os insumos continuam a 11,3%, sem estorno (art. 47 § 10), e o saldo credor é ressarcível.

{{SEC:R139.}}

Conclusão:
- Na hipótese A a redução **só barateia o comprador** (−R$ 222.384), sem mudar o líquido do artista.
- Na hipótese B, quando o artista absorve o tributo, a redução vale **+R$ 139.393/ano na PJ** e **+R$ 116.672/ano na PF** (60%). No regime pleno estimado de 2033, o ganho fica entre R$ 330 mil e R$ 412 mil por ano (seção 14).

---

## 8. 2026 × 2027

{{SEC:Y.}}

Leitura (presumido comercial, 60%):
- 2026: líquido R$ 1.285.477. O PIS/Cofins cumulativo custa R$ 119.720, sobre R − ICMS.
- 2027-A: líquido R$ 1.393.225 (+R$ 107.748). O PIS/Cofins é extinto e a CBS é repassada.
- 2027-B: líquido R$ 1.152.292 (−R$ 133.185 em relação a 2026).
- **Para quem vende a consumidor final (B), 2027 é mais caro que 2026 em todas as estruturas.** A CBS cheia de 11,2% substitui 3,65% de PIS/Cofins, ou zero na PF.
- No lucro real a troca de 9,25% de PIS/Cofins não cumulativo pela CBS é quase neutra (Δ entre −R$ 79 mil e +R$ 4 mil).

---

## 9. Pontos de equilíbrio e mapa do vencedor

{{SEC:E.}}

---

## 10. Sensibilidades

{{SEC:S1.}}

**S1:**
- Com créditos integralmente aproveitáveis, a proporção C_cred/C **não muda** o líquido nem a carga. Muda o IBS/CBS recolhido (e o saldo a ressarcir na exportação).
- Ela só pesa:
  - no Simples, que perde o crédito (−R$ 36 mil a −R$ 145 mil);
  - em caso de glosa de crédito por fornecedor irregular ou documento inidôneo (art. 47 § 1º; art. 48), quando o crédito perdido vira custo;
  - em ateliê residencial ou locador PF não contribuinte (art. 57 § 1º, I; art. 4º § 6º).

{{SEC:S2.}}

{{SEC:S3.}}

{{SEC:S4.}}

{{SEC:S5.}}

**S5:**
- Reter o lucro na PJ adia o IRRF e o IRPFM.
- A capitalização de lucros é "emprego" e sofre retenção e IRPFM (RFB, P&R Q12).
- Distribuir até R$ 50 mil/mês evita a retenção, mas não o IRPFM se a renda total passar de R$ 600 mil.

---

## 11. Crédito de estoque × importação 2027 (cenário 9)

Situações sem crédito de estoque:
- **(a) caso real: sem crédito.** Obras integralizadas pela PF ou vindas da PF ou da empresa francesa sem PIS/Cofins não geram crédito de estoque, porque não foram "adquiridas de PJ domiciliada no País" nem houve PIS/Cofins pago (LC 214 art. 381 § 1º; Dec. 12.955 art. 607 § 1º).
- **Obras do próprio artista importadas de fato:** se vierem fisicamente da França, a integralização em bens é importação tributada normalmente (nota de importação §10, linha E).

**(b) com crédito juridicamente elegível:** o lote de VA R$ 1.000.000 é importado pela PJ do presumido em dezembro de 2026, com PIS/Cofins-Importação pago. Gera crédito presumido de CBS de R$ 117.500, apropriado até 30/6/2027 e usado em 12 parcelas, só contra CBS e sem ressarcimento.

Parâmetros da importação (nota de importação, conferidos):
- NCM 9701.91.00.
- II 3,6%. A preferência Mercosul–UE (2,4% em 2027) não foi verificada.
- IPI NT.
- PIS/Cofins-Importação 11,75% sobre o VA, sem alíquota zero.
- ICMS-SP 18% por dentro.
- Taxa Siscomex, AFRMM e despesas: **não incluídas** (não verificadas).

{{SEC:I.}}

Efeito de caixa e efeito final:
- **Efeito final:** nas alternativas (b) e (c) o custo definitivo é o II (R$ 36.000), porque o ICMS-importação é creditável no RPA.
- **Efeito de caixa:**
  - importar em 2026 deixa R$ 153.500 imobilizados no início de 2027 e só os recupera até jan/2028, em 12 × R$ 9.792;
  - importar em jan/2027 recupera tudo, exceto o II, no mês seguinte;
  - custo financeiro ilustrativo (1% a.m.): R$ 16.745 contra R$ 8.742.
- **Riscos de 2026:**
  - glosa do crédito, por exemplo se as obras não forem "bens novos" ou não estiverem no inventário de 31/12/2026;
  - PJ só exportadora, sem débito de CBS para compensar (não há ressarcimento);
  - em qualquer desses casos o custo final sobe para R$ 153.500.
- **Conclusão:** não há vantagem em antecipar a importação para 2026 só pelo crédito, como a nota de créditos já indicava.
- A posição de SP sobre a base do ICMS-importação muda o desembolso de 2027 em ≈ R$ 25,7 mil (406.180 contra 380.483), mas o ICMS é creditável.

---

## 12. Integralização de lote (VM R$ 2.000.000, custo ≈ 0) vendido em 2027 (cenário 10)

Premissas:
- O lote é vendido dentro de R = 4.000.000 (A, vendas internas).
- C é o operacional da margem.
- O aporte é feito por Mathias já residente (art. 23 da Lei 9.249).

As alternativas:
- (a) Aporte pelo custo: estoque zero, sem IR na entrada; o lucro contábil é o do cenário 2.
- (b) Aporte a mercado:
  - ganho de capital de 15% × 2.000.000 = **R$ 300.000** na PF, devido no mês seguinte ao aporte e fora do IRPFM;
  - estoque e CMV de R$ 2 milhões na PJ;
  - IRPJ/CSLL presumidos **inalterados**;
  - lucro contábil distribuível menor;
  - o caixa excedente volta como **redução de capital**, sem IR até o custo das quotas (CC arts. 1.082-1.084, formalidades não relidas).

{{SEC:G.}}

**Por que o aumento do valor contábil não é neutro:**
1. **No presumido**, o step-up não reduz IRPJ/CSLL, porque a base é a receita.
   - O único efeito é transformar até R$ 2 milhões de dividendos, sujeitos a IRPFM de até 10%, diferido e com redutor, em redução de capital isenta, ao custo de 15% de ganho de capital pago **antes**.
   - Como 15% > 10%, o aporte a mercado **sempre piora** o resultado: −R$ 300.000 (30%), −R$ 156.168 (60%), −R$ 44.291 (90%).
   - Com 90% a perda é menor porque a renda do sócio cai para ~R$ 760 mil, abaixo de R$ 1,2 milhão. A alíquota do IRPFM fica em 2,67% (t_PF 1,23%), e o t_PJ sobe para 13,1%.
2. **Lucro contábil e redutor.** O CMV maior reduz o lucro contábil (negativo a 30% e 60%). Isso eleva t_PJ (13,09% a 90%) e reduz dividendos e IRPFM.
   - O prejuízo contábil acumulado precisa ser absorvido antes de novas distribuições de lucro.
   - Sobra custo de quotas não usado (por exemplo, R$ 541 mil a 60%) para reduções de capital futuras.
3. **No lucro real** o CMV de R$ 2 milhões é dedutível.
   - O IRPJ/CSLL cai R$ 505.704 a 60%, e o aporte a mercado melhora o líquido em R$ 221.913.
   - Ainda assim fica **abaixo** do presumido com aporte pelo custo (R$ 1.336.257 contra R$ 1.393.225).
   - Esse é justamente o arranjo que mais atrai requalificação (rendimento do trabalho a 27,5%), arbitramento do valor (RIR art. 135), DDL (art. 528) e abuso [PONTO NÃO RESOLVIDO; nota de integralização §3].
   - O prejuízo fiscal de R$ 442 mil a 60% teria valor futuro, limitado a 30% do lucro por ano, não modelado.
4. **Obras vindas do exterior.** Se o lote estiver fora do Brasil, a integralização é importação tributada (nota de importação §5). O valor aduaneiro segue o valor de mercado (6º método, com laudo), qualquer que seja o valor de integralização. VA abaixo do valor contábil expõe a multa de 100% (RA art. 703).
   - Em 2027 o custo final da importação é o II: 3,6% × VA = R$ 72.000 para VA de R$ 2 milhões, igual em (a) e (b). O ICMS e a CBS/IBS são creditáveis.
   - O laudo deve ser o mesmo para o capital e para o VA (nota de importação §7).

---

## 13. Empresa francesa mantida (cenário 11), por € 100 de lucro antes do IS

{{SEC:F.}}

Leitura:
- **(i) Disponibilização** (art. 6º): IS 25 + retenção francesa 9,60 (12,8% × 75, abaixo do teto de 15% do tratado) + IRPF 15% × 75 = 11,25, menos crédito de 9,60 = 1,65. **Total 36,25**, como na nota.
- **(ii) Regime anual** (art. 6º-A): 15% × 75 integralmente compensado pelo IS (§ 15). A retenção de 9,60 na distribuição não tem contra o que compensar. **Total 34,60**, como na nota.
  - A base, antes ou depois do IS, e a irrevogabilidade da opção estão em aberto.
- **IRPFM** (Mathias com renda ≥ R$ 1,2 milhão; a Lei 15.270 **não prevê crédito do imposto estrangeiro**) [PONTO NÃO RESOLVIDO]:
  - se o "IRPF apurado com fundamento na Lei 14.754" dedutível (art. 16-A § 3º, III) for o valor após o crédito, o complemento é 10% × 75 − 1,65 = 5,85 em (i) e 7,50 em (ii), e a carga sobe para **42,10**;
  - se for o valor antes do crédito (11,25), o complemento é zero;
  - o redutor não socorre: a francesa não paga IRPJ/CSLL, e mesmo tratando o IS como equivalente, 25% + 7,8% < 34%;
  - argumentos contrários: tratado, art. XXII; CTN, art. 98.
- **(iii) PJ brasileira holding no lucro real:**
  - imposto francês de 36,25 (IS + 15% de retenção à PJ) supera os 34% brasileiros, e o excesso de crédito se perde;
  - a distribuição de 63,75 ao sócio sofre IRPFM de 10% sem redutor, porque o t_PJ brasileiro ≈ 0;
  - **total 42,62**, confirmando a nota ("possivelmente acima de 40%").
- O IS reduzido de 15% sobre os primeiros € 42.500 (PME) não foi modelado.

---

## 14. Regime pleno 2033 (ilustrativo; alíquota ESTIMADA)

Premissas:
- ICMS e ISS extintos.
- CBS+IBS de 26,5% (gatilho do art. 475 § 11 da LC 214, **não** alíquota nem teto) ou 28% (estimativa não reverificada da Fazenda).
- Margem de 60%, vendas internas.
- Demais regras de 2027: IRPJ/CSLL, Lei 15.270, tabela do IRPF.

{{SEC:P.}}

Leitura:
- Em 2033 a hipótese A (R constante) implica preço 26-28% maior. B é o cenário econômico mais plausível.
- Em B, com 26,5%, o presumido rende R$ 1.310.303 e a PF R$ 1.128.647.
- A redução do art. 139 passa a valer ~R$ 330-412 mil/ano: nesse horizonte, a nacionalidade é a variável de maior peso.

---

## 15. O que inverte a conclusão

| Fato | Efeito (2027, m = 60% salvo indicação) | Estrutura favorecida |
|---|---|---|
| **Nacionalidade** (nato/naturalizado → art. 139) | B: +R$ 139 mil/ano (PJ), +R$ 117 mil (PF); A: comprador paga R$ 222 mil a menos; 2033: +R$ 330-412 mil/ano | Não muda a ordem PF × PJ; muda o preço e o valor da naturalização |
| **Estado** (isenção do autor só para PF em MG/RS/BA com estabelecimento efetivo) | PF isenta R$ 1.736.157 contra PJ SP R$ 1.393.225 (A); vantagem em todas as margens | **PF** em UF isenta. MG provavelmente inaplicável (trabalho assalariado); risco de SP alegar estabelecimento paulista (LC 87 art. 11); DIFAL no destino em aberto; isenção cai 10-40% em 2029-2032 |
| **Proporção de exportação** | 100% exportado: presumido R$ 2.041.225, PF R$ 1.736.157, real R$ 1.589.661; break-even real × presumido cai para ~12% | Presumido; real só com margem muito baixa |
| **Encomendas × quadros prontos** | Serviço com ISS 5%: +R$ 187 mil contra comercial; ISS 2%: +R$ 295 mil | PJ de serviços, **se** a qualificação 40.01 se sustentar (SEFAZ-SP: ICMS se houver circulação posterior; risco de dupla exigência) |
| **Margem** | < ~30%: real ≈ presumido e PF (leitura líquida) ≥ presumido; > ~31-36%: presumido | Presumido nas margens do caso (60-90%) |
| **Distribuição × reinvestimento** | Reter 100% adia R$ 144 mil (60%) a R$ 264 mil (90%) de IRPFM/ano | PJ (o diferimento só existe na PJ) |
| **Compradores contribuintes × consumidores finais** | A (repasse) × B (absorção): −R$ 241 mil (presumido 60%). Galerias que revendem creditam o IBS/CBS; colecionador, mesmo PJ, não credita (art. 57, I, "b": obra de arte = uso pessoal) | Não muda a ordem; muda o nível. Mais B que A no varejo de colecionadores |
| **Localização dos empregados** | Em MG a isenção exige obra sem trabalho assalariado. O ICMS segue o estabelecimento onde a obra está (LC 87 art. 11) e o ISS segue o estabelecimento prestador | Mover só o domicílio formal não basta |
| **Leitura do IRPFM da PF** | Literal (receita bruta): PF nunca supera PJ; líquida: PF ≥ presumido abaixo de ~30,6% | PJ (literal) / indiferente em margens baixas (líquida) |
| **ICMS sobre IBS/CBS (posição SP)** | −R$ 36 mil a −R$ 59 mil/ano em todas as estruturas | Neutro entre estruturas |
| **Alíquota da CBS fixada pelo Senado** | Só importa em B: com 9,3%, +R$ 40 mil/ano no presumido | Neutro entre estruturas |
| **Simples** | Vedado; mesmo admitido, a 60% rende R$ 1,08 milhão (Anexo I), contra R$ 1,39 milhão no presumido | Nunca |

---

## 16. Premissas e limitações

Premissas do modelo:
1. **Valores do ano**, sem inflação e sem fluxo intra-anual, salvo no cenário 9. Sem capital de giro. A receita é a mesma em todos os meses e trimestres.
2. **C fixo em reais** nas hipóteses A e B e entre 2026 e 2027. Na prática, os preços dos fornecedores de 2027 podem cair pelo fim do PIS/Cofins embutido, o que não foi modelado.
3. **Créditos de ICMS** sobre insumos (materiais e fretes de contribuintes) **não modelados**: o ICMS das entradas está em C. O efeito é igual em todas as estruturas, salvo na PF isenta, que teria de estornar.
4. **INSS patronal e RAT/terceiros** dos 5 colaboradores estão em C_nc e fora das cargas mostradas.
5. **Pró-labore no teto de 2026.** O teto de 2027 não foi publicado.
6. **Tabela do IRPF de 2026** aplicada a 2027. Não há tabela nova em 19/11/2026.
7. **IRPF do sócio:** só o pró-labore e os dividendos, sem outros rendimentos. Com renda pessoal adicional, o IRPFM sobe para 10% em todas as margens.

Pontos jurídicos sensíveis:
8. **IRPFM da PF:** base bruta ou líquida [PONTO NÃO RESOLVIDO] (seção 3.2).
9. **Redutor:** lucro contábil completo, e não o simplificado do § 6º, que daria t_PJ menor e afastaria ainda mais o redutor. t_PF sobre o valor devido líquido do IRPF da DAA. Sem IN [INTERPRETAÇÃO].
10. **IBS/CBS fora da receita bruta do presumido** (DL 1.598 art. 12 § 4º): sem ato específico [INTERPRETAÇÃO forte].
11. **PIS/Cofins 2026 sem ICMS na base** (Tema 69): dado fora das notas.
12. **Qualificação 8%/12%** (obra própria em estoque) e 32% (encomenda e licenciamento): analógica, sem SC específica.
13. **Exportação:** supõe ressarcimento dos créditos dentro do ano (LC 214 art. 39).
14. **Simples:** ilustrativo e vedado. O C_nc não foi reduzido pela CPP incluída no DAS.

Fora do escopo do modelo:
15. **Riscos de requalificação** (PJ interposta, art. 129, substância, titularidade das obras), **multas** e **custos de conformidade** (contabilidade completa, que a distribuição acima da base presumida e o redutor exigem).
16. **Pagamentos internacionais:** comissões de galerias estrangeiras, royalties, CIDE e IOF.
17. **Residência**, exit tax francês e TVA (nota internacional).
18. **Alíquotas pendentes:** CBS de 2027 depende do Senado (até 15/12/2026). Os valores de 2033 são estimativas.

---

## 17. Verificações contra as notas e divergências

{{SEC:V.}}

**Divergências e esclarecimentos:**
1. **"6,73%" × 6,13%.** O modelo reproduz a carga **efetiva** de 6,13% do presumido comercial com R$ 1 milhão por trimestre (sem ICMS, como na nota). Os 6,73% são a carga **marginal** (nota PJ §3). Sem divergência.
2. **Break-even lucro real × presumido.** A nota de PJ indica 9,06% de margem (exportação, trimestre, só IRPJ/CSLL, sem pró-labore). O modelo encontra ~12,1% (100% exportado) e ~30,1% (vendas internas, 2027-A). A diferença decorre de:
   - o real deduzir o pró-labore e a CPP;
   - a camada de dividendos (no real o redutor neutraliza o IRPFM; no presumido não);
   - em 2027 a CBS ser igual nos dois regimes.
   - Também diverge a afirmação da nota de que o real é "pior que o presumido nas vendas no mercado interno qualquer que seja a margem". Ela valia para 2026 com créditos de PIS/Cofins pouco relevantes. Com C_cred = 50% de C, em 2026 o real já empata com 30% de margem (R$ 218.185 contra R$ 217.337, tabela Y). Em 2027, com a CBS neutra, o real supera o presumido abaixo de ~30%.
3. **Nota de integralização.** No exemplo (b), a nota soma R$ 691.700 (dupla tributação) sem a camada de dividendos. O modelo inclui a Lei 15.270 e mostra que parte do ganho de capital "compra" a fuga ao IRPFM: a perda líquida é de R$ 156 mil (60%), e não de R$ 592 mil. A conclusão da nota se mantém: no presumido o aporte a mercado não compensa.
4. **Nota internacional.** Os 36,25 e 34,60 foram reproduzidos. Os "possivelmente acima de 40%" da holding brasileira foram quantificados em 42,62.
5. **Simples.** A nota de PJ usa as alíquotas de 2026 (Anexo I 9,55%; III 16,80%). O modelo usa as de 2027 (9,45%; 16,70%, LC 214 Anexos XVIII e XX), coerentes com a nota de alíquotas.
6. **Importação.** Todos os totais da nota (406.707; 401.829; 406.180; 380.483; 389.893; 378.385; 422.605) foram reproduzidos, com arredondamento ≤ R$ 1. Na sensibilidade "c = 9,0%" da nota, "c" é a CBS cobrada (referência 9,1%).
7. **Tabela A4 de dividendos** (nota de alíquotas): os 9 casos e o exemplo com pró-labore conferem ao centavo. O redutor do presumido de serviços a 30% (26.924) é bruto: o IRPFM já é zero.
8. **Pontos novos, não tratados nas notas, a levar ao advogado:**
   - (i) base do IRPFM da PF com livro-caixa (bruta × líquida);
   - (ii) exclusão do ICMS da base do PIS/Cofins em 2026 (Tema 69);
   - (iii) na hipótese B a carga sobre o lucro explode em margens baixas, porque C é fixo e o IBS/CBS absorvido consome o lucro.

*Tabelas geradas por `python3 -I projecoes_modelo.py` (saída determinística). Esta memória deve ser regerada após a resolução do Senado sobre a CBS de 2027 (até 15/12/2026) e a publicação do teto do INSS de 2027.*
