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

#### M. Cenário-modelo: PJ presumido comercial, m = 60%, hipótese A, 2027 (100% vendas internas, SP)

| Passo | R$ |
|---|---:|
| R (receita antes de IBS/CBS, com ICMS) | 4.000.000 |
| C = (1 − 0,60) × 4.000.000 | 1.600.000 |
|   C_cred = 50% × C | 800.000 |
|   C_nc = 50% × C | 800.000 |
| ICMS = 18% × R | 720.000 |
| Base IBS/CBS = R − ICMS | 3.280.000 |
| CBS = 11,2% × base | 367.360 |
| IBS = 0,1% × base | 3.280 |
| IBS+CBS destacados (débito) | 370.640 |
| Preço pago pelo comprador = R + IBS + CBS | 4.370.640 |
| Créditos IBS/CBS = 11,3% × C_cred | 90.400 |
| IBS/CBS recolhido líquido = débito − créditos | 280.240 |
| L0 = R − C − ICMS | 1.680.000 |
| Pró-labore = 12 × 8.475,55 | 101.707 |
| CPP 20% s/ pró-labore | 20.341 |
| Lucro contábil LC = L0 − pró-labore − CPP | 1.557.952 |
| Base IRPJ = 8% × R | 320.000 |
| IRPJ = 15% × base + 10% × (base − 240.000) | 56.000 |
| Base CSLL = 12% × R | 480.000 |
| CSLL = 9% × base | 43.200 |
| Caixa disponível = LC − IRPJ − CSLL | 1.458.752 |
| Dividendos D (100%, 12 × D/12) | 1.458.752 |
|   D/12 por mês | 121.563 |
| IRRF 10% s/ total (D/12 > 50.000) — ano | 145.875 |
| REND IRPFM = D + pró-labore | 1.560.459 |
| IRPF devido DAA s/ pró-labore (simplificado) | 12.214 |
| IRPFM antes do redutor = 10% × REND − IRPF devido | 143.832 |
| Redutor = D × max(0; t_PJ + t_PF − 34%) | 0 |
| IRPFM final | 143.832 |
| Saldo da DAA = IRPFM − IRRF (− = restituição) | −2.043 |
| INSS do sócio 11% | 11.188 |
| Líquido ao sócio = PL − INSS − IRPF + D − IRPFM | 1.393.225 |
| Tributos suportados (ICMS + IRPJ + CSLL + CPP + INSS + IRPF + IRPFM) | 1.006.775 |

t_PJ = (IRPJ+CSLL)/LC = 6,37%; t_PF = 9,86%; soma 16,23% < 34% → redutor zero.
Carga suportada: 25,17% de R; 23,03% do preço pago; com IBS/CBS destacado: 31,52% do preço; sobre o lucro L0 (tributos sobre renda + INSS/CPP): 17,07%.

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

#### T-A-30. 2027, hipótese A, margem 30% — 100% vendas internas

| Cenário | (1) R | (2) Pago pelo comprador | (3) Lucro contábil¹ | (4) Caixa disponível² | (5) Líquido ao artista/sócio | (6a) Carga s/ R | (6b) Carga s/ preço | (6c) Carga c/ IBS-CBS s/ preço | (6d) Carga s/ lucro L0 |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| 1. PF residente (ICMS SP 18%) | 4.000.000 | 4.370.640 | 480.000 | 59.659 | 59.659 | 28,51% | 26,09% | 34,57% | 87,57% |
| 1'. PF em UF com isenção do autor (ICMS 0%) | 4.000.000 | 4.452.000 | 1.200.000 | 779.659 | 779.659 | 10,51% | 9,44% | 19,59% | 35,03% |
| 2. PJ presumido comercial (8%/12%) | 4.000.000 | 4.370.640 | 357.952 | 258.752 | 337.057 | 21,57% | 19,74% | 28,22% | 29,78% |
| 3. PJ presumido serviços, ISS 5% | 4.000.000 | 4.429.400 | 877.952 | 466.752 | 545.057 | 16,37% | 14,79% | 24,48% | 45,49% |
| 3'. PJ presumido serviços, ISS 2% | 4.000.000 | 4.442.960 | 997.952 | 586.752 | 665.057 | 13,37% | 12,04% | 22,01% | 40,62% |
| 4. PJ lucro real | 4.000.000 | 4.370.640 | 357.952 | 260.248 | 338.554 | 21,54% | 19,71% | 28,19% | 29,47% |
| 5. Simples Anexo I — VEDADO (ilustr.) | 4.000.000 | 4.003.280 | −68.547 | −157.907 | −79.601 | 31,99% | 31,96% | 32,05% | 141,20% |
| 5'. Simples Anexo III — VEDADO (ilustr.) | 4.000.000 | 4.003.280 | −113.038 | −447.907 | −369.601 | 39,24% | 39,21% | 39,29% | 291,56% |

#### T-A-60. 2027, hipótese A, margem 60% — 100% vendas internas

| Cenário | (1) R | (2) Pago pelo comprador | (3) Lucro contábil¹ | (4) Caixa disponível² | (5) Líquido ao artista/sócio | (6a) Carga s/ R | (6b) Carga s/ preço | (6c) Carga c/ IBS-CBS s/ preço | (6d) Carga s/ lucro L0 |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| 1. PF residente (ICMS SP 18%) | 4.000.000 | 4.370.640 | 1.680.000 | 1.214.157 | 1.214.157 | 29,65% | 27,13% | 35,61% | 27,73% |
| 1'. PF em UF com isenção do autor (ICMS 0%) | 4.000.000 | 4.452.000 | 2.400.000 | 1.736.157 | 1.736.157 | 16,60% | 14,91% | 25,06% | 27,66% |
| 2. PJ presumido comercial (8%/12%) | 4.000.000 | 4.370.640 | 1.557.952 | 1.458.752 | 1.393.225 | 25,17% | 23,03% | 31,52% | 17,07% |
| 3. PJ presumido serviços, ISS 5% | 4.000.000 | 4.429.400 | 2.077.952 | 1.666.752 | 1.580.425 | 20,49% | 18,50% | 28,20% | 28,16% |
| 3'. PJ presumido serviços, ISS 2% | 4.000.000 | 4.442.960 | 2.197.952 | 1.786.752 | 1.688.425 | 17,79% | 16,02% | 25,99% | 27,22% |
| 4. PJ lucro real | 4.000.000 | 4.370.640 | 1.557.952 | 1.052.248 | 1.114.344 | 32,14% | 29,42% | 37,90% | 33,67% |
| 5. Simples Anexo I — VEDADO (ilustr.) | 4.000.000 | 4.003.280 | 1.199.253 | 1.109.893 | 1.079.252 | 33,02% | 32,99% | 33,07% | 26,13% |
| 5'. Simples Anexo III — VEDADO (ilustr.) | 4.000.000 | 4.003.280 | 1.154.762 | 819.893 | 861.015 | 38,47% | 38,44% | 38,53% | 41,06% |

#### T-A-90. 2027, hipótese A, margem 90% — 100% vendas internas

| Cenário | (1) R | (2) Pago pelo comprador | (3) Lucro contábil¹ | (4) Caixa disponível² | (5) Líquido ao artista/sócio | (6a) Carga s/ R | (6b) Carga s/ preço | (6c) Carga c/ IBS-CBS s/ preço | (6d) Carga s/ lucro L0 |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| 1. PF residente (ICMS SP 18%) | 4.000.000 | 4.370.640 | 2.880.000 | 2.084.157 | 2.084.157 | 37,90% | 34,68% | 43,16% | 27,63% |
| 1'. PF em UF com isenção do autor (ICMS 0%) | 4.000.000 | 4.452.000 | 3.600.000 | 2.606.157 | 2.606.157 | 24,85% | 22,32% | 32,48% | 27,61% |
| 2. PJ presumido comercial (8%/12%) | 4.000.000 | 4.370.640 | 2.757.952 | 2.658.752 | 2.473.225 | 28,17% | 25,78% | 34,26% | 14,12% |
| 3. PJ presumido serviços, ISS 5% | 4.000.000 | 4.429.400 | 3.277.952 | 2.866.752 | 2.660.425 | 23,49% | 21,21% | 30,91% | 21,75% |
| 3'. PJ presumido serviços, ISS 2% | 4.000.000 | 4.442.960 | 3.397.952 | 2.986.752 | 2.768.425 | 20,79% | 18,72% | 28,69% | 21,35% |
| 4. PJ lucro real | 4.000.000 | 4.370.640 | 2.757.952 | 1.844.248 | 1.906.505 | 42,34% | 38,75% | 47,23% | 33,80% |
| 5. Simples Anexo I — VEDADO (ilustr.) | 4.000.000 | 4.003.280 | 2.467.053 | 2.377.693 | 2.220.272 | 34,49% | 34,46% | 34,55% | 18,64% |
| 5'. Simples Anexo III — VEDADO (ilustr.) | 4.000.000 | 4.003.280 | 2.422.562 | 2.087.693 | 1.959.272 | 41,02% | 40,98% | 41,07% | 28,19% |

#### T-B-30. 2027, hipótese B, margem 30% — 100% vendas internas

| Cenário | (1) R | (2) Pago pelo comprador | (3) Lucro contábil¹ | (4) Caixa disponível² | (5) Líquido ao artista/sócio | (6a) Carga s/ R | (6b) Carga s/ preço | (6c) Carga c/ IBS-CBS s/ preço | (6d) Carga s/ lucro L0 |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| 1. PF residente (ICMS SP 18%) | 3.660.791 | 4.000.000 | 201.849 | −184.572 | −184.572 | 28,56% | 26,13% | 34,61% | 191,44% |
| 1'. PF em UF com isenção do autor (ICMS 0%) | 3.593.890 | 4.000.000 | 793.890 | 414.160 | 414.160 | 10,57% | 9,49% | 19,65% | 47,83% |
| 2. PJ presumido comercial (8%/12%) | 3.660.791 | 4.000.000 | 79.801 | −8.952 | 69.354 | 21,62% | 19,79% | 28,27% | 65,64% |
| 3. PJ presumido serviços, ISS 5% | 3.612.227 | 4.000.000 | 509.568 | 140.558 | 218.863 | 16,43% | 14,83% | 24,53% | 65,35% |
| 3'. PJ presumido serviços, ISS 2% | 3.601.203 | 4.000.000 | 607.131 | 239.320 | 317.625 | 13,43% | 12,09% | 22,06% | 56,44% |
| 4. PJ lucro real | 3.660.791 | 4.000.000 | 79.801 | 60.649 | 138.954 | 19,72% | 18,05% | 26,53% | 31,16% |

#### T-B-60. 2027, hipótese B, margem 60% — 100% vendas internas

| Cenário | (1) R | (2) Pago pelo comprador | (3) Lucro contábil¹ | (4) Caixa disponível² | (5) Líquido ao artista/sócio | (6a) Carga s/ R | (6b) Carga s/ preço | (6c) Carga c/ IBS-CBS s/ preço | (6d) Carga s/ lucro L0 |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| 1. PF residente (ICMS SP 18%) | 3.660.791 | 4.000.000 | 1.401.849 | 1.012.498 | 1.012.498 | 28,64% | 26,21% | 34,69% | 27,77% |
| 1'. PF em UF com isenção do autor (ICMS 0%) | 3.593.890 | 4.000.000 | 1.993.890 | 1.441.728 | 1.441.728 | 15,36% | 13,80% | 23,96% | 27,69% |
| 2. PJ presumido comercial (8%/12%) | 3.660.791 | 4.000.000 | 1.279.801 | 1.191.048 | 1.152.292 | 24,82% | 22,71% | 31,19% | 17,80% |
| 3. PJ presumido serviços, ISS 5% | 3.612.227 | 4.000.000 | 1.709.568 | 1.340.558 | 1.286.850 | 20,08% | 18,13% | 27,83% | 29,74% |
| 3'. PJ presumido serviços, ISS 2% | 3.601.203 | 4.000.000 | 1.807.131 | 1.439.320 | 1.375.736 | 17,37% | 15,64% | 25,61% | 28,69% |
| 4. PJ lucro real | 3.660.791 | 4.000.000 | 1.279.801 | 868.669 | 930.684 | 30,87% | 28,25% | 36,73% | 33,61% |

#### T-B-90. 2027, hipótese B, margem 90% — 100% vendas internas

| Cenário | (1) R | (2) Pago pelo comprador | (3) Lucro contábil¹ | (4) Caixa disponível² | (5) Líquido ao artista/sócio | (6a) Carga s/ R | (6b) Carga s/ preço | (6c) Carga c/ IBS-CBS s/ preço | (6d) Carga s/ lucro L0 |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| 1. PF residente (ICMS SP 18%) | 3.660.791 | 4.000.000 | 2.601.849 | 1.882.498 | 1.882.498 | 37,65% | 34,46% | 42,94% | 27,65% |
| 1'. PF em UF com isenção do autor (ICMS 0%) | 3.593.890 | 4.000.000 | 3.193.890 | 2.311.728 | 2.311.728 | 24,55% | 22,05% | 32,21% | 27,62% |
| 2. PJ presumido comercial (8%/12%) | 3.660.791 | 4.000.000 | 2.479.801 | 2.391.048 | 2.232.292 | 28,10% | 25,71% | 34,19% | 14,20% |
| 3. PJ presumido serviços, ISS 5% | 3.612.227 | 4.000.000 | 2.909.568 | 2.540.558 | 2.366.850 | 23,40% | 21,13% | 30,83% | 21,93% |
| 3'. PJ presumido serviços, ISS 2% | 3.601.203 | 4.000.000 | 3.007.131 | 2.639.320 | 2.455.736 | 20,70% | 18,64% | 28,61% | 21,52% |
| 4. PJ lucro real | 3.660.791 | 4.000.000 | 2.479.801 | 1.660.669 | 1.722.901 | 42,01% | 38,45% | 46,93% | 33,78% |

¹ Lucro contábil: PJ = R − C − tributos sobre consumo absorvidos − pró-labore − CPP − CMV extra (antes de IRPJ/CSLL). PF: não há lucro contábil; mostra-se L0 = R − C − ICMS (resultado do livro-caixa antes do INSS).

² Caixa disponível: PJ = caixa após tributos da PJ e pró-labore, antes da distribuição; PF = caixa após IRPF/INSS/IRPFM.

Observações:
- Na hipótese B com m = 30% a margem efetiva praticamente desaparece. A PF (leitura "bruta") e o presumido ficam com caixa negativo, porque C é fixo em reais e o IBS/CBS absorvido (~R$ 339 mil) consome o lucro.
- **O IRPFM da PF é zero com margem ≥ 60% nas duas leituras.** O IRPF progressivo (27,5% marginal) já supera 10% da receita bruta, como se pedia verificar.
- Com 30% de margem, a leitura literal gera IRPFM de R$ 284.499 (A).

#### T-PF. PF: IRPFM sobre receita bruta (literal) × sobre rendimento líquido do livro-caixa

| Hip. | m | ICMS | IRPF | IRPFM (bruta) | Líquido (bruta) | IRPFM (líquida) | Líquido (líquida) |
|---|---:|---:|---:|---:|---:|---:|---:|
| A | 30% | SP 18% | 115.501 | 284.499 | 59.659 | 0 | 344.157 |
| A | 30% | isenção 0% | 313.501 | 86.499 | 779.659 | 0 | 866.157 |
| A | 60% | SP 18% | 445.501 | 0 | 1.214.157 | 0 | 1.214.157 |
| A | 60% | isenção 0% | 643.501 | 0 | 1.736.157 | 0 | 1.736.157 |
| A | 90% | SP 18% | 775.501 | 0 | 2.084.157 | 0 | 2.084.157 |
| A | 90% | isenção 0% | 973.501 | 0 | 2.606.157 | 0 | 2.606.157 |
| B | 30% | SP 18% | 39.010 | 327.069 | −184.572 | 0 | 142.498 |
| B | 30% | isenção 0% | 201.821 | 157.568 | 414.160 | 0 | 571.728 |
| B | 60% | SP 18% | 369.010 | 0 | 1.012.498 | 0 | 1.012.498 |
| B | 60% | isenção 0% | 531.821 | 0 | 1.441.728 | 0 | 1.441.728 |
| B | 90% | SP 18% | 699.010 | 0 | 1.882.498 | 0 | 1.882.498 |
| B | 90% | isenção 0% | 861.821 | 0 | 2.311.728 | 0 | 2.311.728 |

#### T-DIV. Detalhe de dividendos (2027, hipótese A, vendas internas)

| Cenário | m | Lucro contábil | IRPJ+CSLL | t_PJ | D | D/mês | IRRF ano | Alíq. IRPFM | t_PF | Redutor | IRPFM final | Saldo DAA |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| 2. PJ presumido comercial (8%/12%) | 30% | 357.952 | 99.200 | 27,71% | 258.752 | 21.563 | 0 | 0,00% | 0,00% | 0 | 0 | 0 |
| 2. PJ presumido comercial (8%/12%) | 60% | 1.557.952 | 99.200 | 6,37% | 1.458.752 | 121.563 | 145.875 | 10,00% | 9,86% | 0 | 143.832 | −2.043 |
| 2. PJ presumido comercial (8%/12%) | 90% | 2.757.952 | 99.200 | 3,60% | 2.658.752 | 221.563 | 265.875 | 10,00% | 9,92% | 0 | 263.832 | −2.043 |
| 3. PJ presumido serviços, ISS 5% | 30% | 877.952 | 411.200 | 46,84% | 466.752 | 38.896 | 0 | 0,00% | 0,00% | 0 | 0 | 0 |
| 3. PJ presumido serviços, ISS 5% | 60% | 2.077.952 | 411.200 | 19,79% | 1.666.752 | 138.896 | 166.675 | 10,00% | 9,88% | 0 | 164.632 | −2.043 |
| 3. PJ presumido serviços, ISS 5% | 90% | 3.277.952 | 411.200 | 12,54% | 2.866.752 | 238.896 | 286.675 | 10,00% | 9,93% | 0 | 284.632 | −2.043 |
| 4. PJ lucro real | 30% | 357.952 | 97.704 | 27,30% | 260.248 | 21.687 | 0 | 0,00% | 0,00% | 0 | 0 | 0 |
| 4. PJ lucro real | 60% | 1.557.952 | 505.704 | 32,46% | 1.052.248 | 87.687 | 105.225 | 9,23% | 8,96% | 78.116 | 16.210 | −89.015 |
| 4. PJ lucro real | 90% | 2.757.952 | 913.704 | 33,13% | 1.844.248 | 153.687 | 184.425 | 10,00% | 9,89% | 166.333 | 16.049 | −168.376 |

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

#### X. Exportação (2027, hipótese A): 100% exportado e 50/50

| Cenário | Export. | m | Pago pelo comprador | ICMS | IBS/CBS líquido (− = ressarcir) | Lucro contábil¹ | Líquido | Carga s/ R | Carga c/ IBS-CBS s/ preço | Carga s/ L0 |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| 1. PF residente (ICMS SP 18%) | 0% | 30% | 4.370.640 | 720.000 | 212.440 | 480.000 | 59.659 | 28,51% | 34,57% | 87,57% |
| 1. PF residente (ICMS SP 18%) | 0% | 60% | 4.370.640 | 720.000 | 280.240 | 1.680.000 | 1.214.157 | 29,65% | 35,61% | 27,73% |
| 1. PF residente (ICMS SP 18%) | 0% | 90% | 4.370.640 | 720.000 | 348.040 | 2.880.000 | 2.084.157 | 37,90% | 43,16% | 27,63% |
| 1. PF residente (ICMS SP 18%) | 50% | 30% | 4.185.320 | 360.000 | 27.120 | 840.000 | 419.659 | 19,51% | 23,07% | 50,04% |
| 1. PF residente (ICMS SP 18%) | 50% | 60% | 4.185.320 | 360.000 | 94.920 | 2.040.000 | 1.475.157 | 23,12% | 26,53% | 27,69% |
| 1. PF residente (ICMS SP 18%) | 50% | 90% | 4.185.320 | 360.000 | 162.720 | 3.240.000 | 2.345.157 | 31,37% | 34,41% | 27,62% |
| 1. PF residente (ICMS SP 18%) | 100% | 30% | 4.000.000 | 0 | −158.200 | 1.200.000 | 779.659 | 10,51% | 10,51% | 35,03% |
| 1. PF residente (ICMS SP 18%) | 100% | 60% | 4.000.000 | 0 | −90.400 | 2.400.000 | 1.736.157 | 16,60% | 16,60% | 27,66% |
| 1. PF residente (ICMS SP 18%) | 100% | 90% | 4.000.000 | 0 | −22.600 | 3.600.000 | 2.606.157 | 24,85% | 24,85% | 27,61% |
| 2. PJ presumido comercial (8%/12%) | 0% | 30% | 4.370.640 | 720.000 | 212.440 | 357.952 | 337.057 | 21,57% | 28,22% | 29,78% |
| 2. PJ presumido comercial (8%/12%) | 0% | 60% | 4.370.640 | 720.000 | 280.240 | 1.557.952 | 1.393.225 | 25,17% | 31,52% | 17,07% |
| 2. PJ presumido comercial (8%/12%) | 0% | 90% | 4.370.640 | 720.000 | 348.040 | 2.757.952 | 2.473.225 | 28,17% | 34,26% | 14,12% |
| 2. PJ presumido comercial (8%/12%) | 50% | 30% | 4.185.320 | 360.000 | 27.120 | 717.952 | 694.807 | 12,63% | 16,50% | 17,28% |
| 2. PJ presumido comercial (8%/12%) | 50% | 60% | 4.185.320 | 360.000 | 94.920 | 1.917.952 | 1.717.225 | 17,07% | 20,74% | 15,82% |
| 2. PJ presumido comercial (8%/12%) | 50% | 90% | 4.185.320 | 360.000 | 162.720 | 3.117.952 | 2.797.225 | 20,07% | 23,61% | 13,67% |
| 2. PJ presumido comercial (8%/12%) | 100% | 30% | 4.000.000 | 0 | −158.200 | 1.077.952 | 982.752 | 5,43% | 5,43% | 18,10% |
| 2. PJ presumido comercial (8%/12%) | 100% | 60% | 4.000.000 | 0 | −90.400 | 2.277.952 | 2.041.225 | 8,97% | 8,97% | 14,95% |
| 2. PJ presumido comercial (8%/12%) | 100% | 90% | 4.000.000 | 0 | −22.600 | 3.477.952 | 3.121.225 | 11,97% | 11,97% | 13,30% |
| 4. PJ lucro real | 0% | 30% | 4.370.640 | 720.000 | 212.440 | 357.952 | 338.554 | 21,54% | 28,19% | 29,47% |
| 4. PJ lucro real | 0% | 60% | 4.370.640 | 720.000 | 280.240 | 1.557.952 | 1.114.344 | 32,14% | 37,90% | 33,67% |
| 4. PJ lucro real | 0% | 90% | 4.370.640 | 720.000 | 348.040 | 2.757.952 | 1.906.505 | 42,34% | 47,23% | 33,80% |
| 4. PJ lucro real | 50% | 30% | 4.185.320 | 360.000 | 27.120 | 717.952 | 576.154 | 15,60% | 19,33% | 31,41% |
| 4. PJ lucro real | 50% | 60% | 4.185.320 | 360.000 | 94.920 | 1.917.952 | 1.352.013 | 26,20% | 29,47% | 33,72% |
| 4. PJ lucro real | 50% | 90% | 4.185.320 | 360.000 | 162.720 | 3.117.952 | 2.144.129 | 36,40% | 39,21% | 33,82% |
| 4. PJ lucro real | 100% | 30% | 4.000.000 | 0 | −158.200 | 1.077.952 | 797.379 | 10,07% | 10,07% | 33,55% |
| 4. PJ lucro real | 100% | 60% | 4.000.000 | 0 | −90.400 | 2.277.952 | 1.589.661 | 20,26% | 20,26% | 33,76% |
| 4. PJ lucro real | 100% | 90% | 4.000.000 | 0 | −22.600 | 3.477.952 | 2.381.748 | 30,46% | 30,46% | 33,84% |

Hipótese B na exportação: idêntica à A quando 100% exportado (sem IBS/CBS, preço = R). No 50/50 em B só a metade interna muda:

| Cenário | Export. | m | R | Pago pelo comprador | ICMS | IBS/CBS líquido | Lucro contábil¹ | Líquido | Carga s/ R | Carga c/ IBS-CBS s/ preço |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| 1. PF residente (ICMS SP 18%) | 50% (B) | 30% | 3.830.396 | 4.000.000 | 329.471 | 11.404 | 700.924 | 297.543 | 19,13% | 22,56% |
| 1. PF residente (ICMS SP 18%) | 50% (B) | 60% | 3.830.396 | 4.000.000 | 329.471 | 79.204 | 1.900.924 | 1.374.327 | 22,35% | 25,64% |
| 1. PF residente (ICMS SP 18%) | 50% (B) | 90% | 3.830.396 | 4.000.000 | 329.471 | 147.004 | 3.100.924 | 2.244.327 | 30,96% | 33,89% |
| 2. PJ presumido comercial (8%/12%) | 50% (B) | 30% | 3.830.396 | 4.000.000 | 329.471 | 11.404 | 578.876 | 563.205 | 12,20% | 15,92% |
| 2. PJ presumido comercial (8%/12%) | 50% (B) | 60% | 3.830.396 | 4.000.000 | 329.471 | 79.204 | 1.778.876 | 1.596.758 | 16,54% | 20,08% |
| 2. PJ presumido comercial (8%/12%) | 50% (B) | 90% | 3.830.396 | 4.000.000 | 329.471 | 147.004 | 2.978.876 | 2.676.758 | 19,68% | 23,08% |
| 4. PJ lucro real | 50% (B) | 30% | 3.830.396 | 4.000.000 | 329.471 | 11.404 | 578.876 | 484.364 | 14,26% | 17,89% |
| 4. PJ lucro real | 50% (B) | 60% | 3.830.396 | 4.000.000 | 329.471 | 79.204 | 1.778.876 | 1.260.200 | 25,33% | 28,50% |
| 4. PJ lucro real | 50% (B) | 90% | 3.830.396 | 4.000.000 | 329.471 | 147.004 | 2.978.876 | 2.052.330 | 35,98% | 38,69% |

¹ Lucro contábil: PJ = R − C − tributos sobre consumo absorvidos − pró-labore − CPP − CMV extra (antes de IRPJ/CSLL). PF: não há lucro contábil; mostra-se L0 = R − C − ICMS (resultado do livro-caixa antes do INSS).

² Caixa disponível: PJ = caixa após tributos da PJ e pró-labore, antes da distribuição; PF = caixa após IRPF/INSS/IRPFM.

---

## 7. Redução de 60% do art. 139 (cenário 7)

**Como francês, Mathias paga a alíquota cheia.** A redução vale só para obras "produzidas por artistas brasileiros" (§ 3º), lidas como de autor brasileiro **nato ou naturalizado**, independentemente de residência [INTERPRETAÇÃO DEFENSÁVEL; nota art. 139].

Pontos abertos:
- Obras produzidas antes de uma naturalização [PONTO NÃO RESOLVIDO].
- A tese de não discriminação do tratado (art. XXIV), que só serviria à PF [PONTO NÃO RESOLVIDO].

Com a redução, a alíquota passa a 4,48% de CBS + 0,04% de IBS = 4,52%. Os créditos sobre os insumos continuam a 11,3%, sem estorno (art. 47 § 10), e o saldo credor é ressarcível.

#### R139. Redução de 60% (art. 139) — hipótese de Mathias brasileiro nato/naturalizado (2027, vendas internas)

| Cenário | Hip. | m | Preço (cheia) | Preço (−60%) | R (cheia) | R (−60%) | IBS/CBS líq. (cheia) | IBS/CBS líq. (−60%) | Líquido (cheia) | Líquido (−60%) | Diferença |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| 1. PF residente (ICMS SP 18%) | A | 30% | 4.370.640 | 4.148.256 | 4.000.000 | 4.000.000 | 212.440 | −9.944 | 59.659 | 59.659 | 0 |
| 1. PF residente (ICMS SP 18%) | A | 60% | 4.370.640 | 4.148.256 | 4.000.000 | 4.000.000 | 280.240 | 57.856 | 1.214.157 | 1.214.157 | 0 |
| 1. PF residente (ICMS SP 18%) | A | 90% | 4.370.640 | 4.148.256 | 4.000.000 | 4.000.000 | 348.040 | 125.656 | 2.084.157 | 2.084.157 | 0 |
| 1. PF residente (ICMS SP 18%) | B | 30% | 4.000.000 | 4.000.000 | 3.660.791 | 3.857.043 | 181.009 | −15.243 | −184.572 | −43.271 | 141.301 |
| 1. PF residente (ICMS SP 18%) | B | 60% | 4.000.000 | 4.000.000 | 3.660.791 | 3.857.043 | 248.809 | 52.557 | 1.012.498 | 1.129.169 | 116.672 |
| 1. PF residente (ICMS SP 18%) | B | 90% | 4.000.000 | 4.000.000 | 3.660.791 | 3.857.043 | 316.609 | 120.357 | 1.882.498 | 1.999.169 | 116.672 |
| 2. PJ presumido comercial (8%/12%) | A | 30% | 4.370.640 | 4.148.256 | 4.000.000 | 4.000.000 | 212.440 | −9.944 | 337.057 | 337.057 | 0 |
| 2. PJ presumido comercial (8%/12%) | A | 60% | 4.370.640 | 4.148.256 | 4.000.000 | 4.000.000 | 280.240 | 57.856 | 1.393.225 | 1.393.225 | 0 |
| 2. PJ presumido comercial (8%/12%) | A | 90% | 4.370.640 | 4.148.256 | 4.000.000 | 4.000.000 | 348.040 | 125.656 | 2.473.225 | 2.473.225 | 0 |
| 2. PJ presumido comercial (8%/12%) | B | 30% | 4.000.000 | 4.000.000 | 3.660.791 | 3.857.043 | 181.009 | −15.243 | 69.354 | 224.235 | 154.882 |
| 2. PJ presumido comercial (8%/12%) | B | 60% | 4.000.000 | 4.000.000 | 3.660.791 | 3.857.043 | 248.809 | 52.557 | 1.152.292 | 1.291.685 | 139.393 |
| 2. PJ presumido comercial (8%/12%) | B | 90% | 4.000.000 | 4.000.000 | 3.660.791 | 3.857.043 | 316.609 | 120.357 | 2.232.292 | 2.371.685 | 139.393 |

Conclusão:
- Na hipótese A a redução **só barateia o comprador** (−R$ 222.384), sem mudar o líquido do artista.
- Na hipótese B, quando o artista absorve o tributo, a redução vale **+R$ 139.393/ano na PJ** e **+R$ 116.672/ano na PF** (60%). No regime pleno estimado de 2033, o ganho fica entre R$ 330 mil e R$ 412 mil por ano (seção 14).

---

## 8. 2026 × 2027

#### Y. 2026 × 2027 (vendas internas; em 2026 o comprador paga R = 4.000.000)

| Cenário | m | PIS/Cofins 2026 | Tributos 2026 | Líquido 2026 | Preço 2027-A | Líquido 2027-A | R 2027-B | Líquido 2027-B | Δ 2027-B − 2026 |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| 1. PF residente (ICMS SP 18%) | 30% | 0 | 1.140.341 | 59.659 | 4.370.640 | 59.659 | 3.660.791 | −184.572 | −244.230 |
| 1. PF residente (ICMS SP 18%) | 60% | 0 | 1.185.843 | 1.214.157 | 4.370.640 | 1.214.157 | 3.660.791 | 1.012.498 | −201.660 |
| 1. PF residente (ICMS SP 18%) | 90% | 0 | 1.515.843 | 2.084.157 | 4.370.640 | 2.084.157 | 3.660.791 | 1.882.498 | −201.660 |
| 2. PJ presumido comercial (8%/12%) | 30% | 119.720 | 982.663 | 217.337 | 4.370.640 | 337.057 | 3.660.791 | 69.354 | −147.984 |
| 2. PJ presumido comercial (8%/12%) | 60% | 119.720 | 1.114.523 | 1.285.477 | 4.370.640 | 1.393.225 | 3.660.791 | 1.152.292 | −133.185 |
| 2. PJ presumido comercial (8%/12%) | 90% | 119.720 | 1.234.523 | 2.365.477 | 4.370.640 | 2.473.225 | 3.660.791 | 2.232.292 | −133.185 |
| 3. PJ presumido serviços, ISS 5% | 30% | 146.000 | 800.943 | 399.057 | 4.429.400 | 545.057 | 3.612.227 | 218.863 | −180.194 |
| 3. PJ presumido serviços, ISS 5% | 60% | 146.000 | 950.975 | 1.449.025 | 4.429.400 | 1.580.425 | 3.612.227 | 1.286.850 | −162.175 |
| 3. PJ presumido serviços, ISS 5% | 90% | 146.000 | 1.070.975 | 2.529.025 | 4.429.400 | 2.660.425 | 3.612.227 | 2.366.850 | −162.175 |
| 4. PJ lucro real | 30% | 173.900 | 981.815 | 218.185 | 4.370.640 | 338.554 | 3.660.791 | 138.954 | −79.231 |
| 4. PJ lucro real | 60% | 229.400 | 1.437.124 | 962.876 | 4.370.640 | 1.114.344 | 3.660.791 | 930.684 | −32.192 |
| 4. PJ lucro real | 90% | 284.900 | 1.881.553 | 1.718.447 | 4.370.640 | 1.906.505 | 3.660.791 | 1.722.901 | 4.455 |

Leitura (presumido comercial, 60%):
- 2026: líquido R$ 1.285.477. O PIS/Cofins cumulativo custa R$ 119.720, sobre R − ICMS.
- 2027-A: líquido R$ 1.393.225 (+R$ 107.748). O PIS/Cofins é extinto e a CBS é repassada.
- 2027-B: líquido R$ 1.152.292 (−R$ 133.185 em relação a 2026).
- **Para quem vende a consumidor final (B), 2027 é mais caro que 2026 em todas as estruturas.** A CBS cheia de 11,2% substitui 3,65% de PIS/Cofins, ou zero na PF.
- No lucro real a troca de 9,25% de PIS/Cofins não cumulativo pela CBS é quase neutra (Δ entre −R$ 79 mil e +R$ 4 mil).

---

## 9. Pontos de equilíbrio e mapa do vencedor

#### E. Pontos de equilíbrio de margem (2027)

| Comparação (líquido ao artista/sócio) | Margem de equilíbrio |
|---|---:|
| Lucro real × presumido comercial (internas, A) | 30,1% |
| Lucro real × presumido comercial (internas, B) | 36,3% |
| Lucro real × presumido comercial (100% export.) | 12,1% |
| Lucro real × presumido serviços ISS 5% (internas, A) | não se cruzam entre 5% e 95% |
| PF (IRPFM bruta) × presumido comercial (A) | não se cruzam entre 5% e 95% |
| PF (IRPFM líquida) × presumido comercial (A) | 30,6% |
| PF isenção ICMS (IRPFM líquida) × presumido comercial SP (A) | não se cruzam entre 5% e 95% |

| m | PF (IRPFM bruta) | PF (IRPFM líquida) | PJ presumido com. | PJ real | Maior líquido |
|---|---:|---:|---:|---:|---:|
| 20% | −336.000 | 57.305 | −62.943 | 36.257 | PF (líquida) |
| 25% | −140.341 | 199.157 | 137.057 | 198.349 | PF (líquida) |
| 30% | 59.659 | 344.157 | 337.057 | 338.554 | PF (líquida) |
| 35% | 259.659 | 489.157 | 537.057 | 470.554 | Presumido |
| 40% | 459.659 | 634.157 | 728.934 | 602.554 | Presumido |
| 50% | 859.659 | 924.157 | 1.040.873 | 850.216 | Presumido |
| 60% | 1.214.157 | 1.214.157 | 1.393.225 | 1.114.344 | Presumido |
| 70% | 1.504.157 | 1.504.157 | 1.753.225 | 1.378.419 | Presumido |
| 80% | 1.794.157 | 1.794.157 | 2.113.225 | 1.642.469 | Presumido |
| 90% | 2.084.157 | 2.084.157 | 2.473.225 | 1.906.505 | Presumido |

---

## 10. Sensibilidades

#### S1. Sensibilidade C_cred/C — PJ presumido comercial, m = 60%

| C_cred/C | Variante | Créditos IBS/CBS | IBS/CBS recolhido líq. (− = ressarcir) | Crédito perdido | Líquido ao sócio | Carga c/ IBS-CBS s/ preço |
|---|---:|---:|---:|---:|---:|---:|
| 20% | A, internas | 36.160 | 334.480 | 0 | 1.393.225 | 31,52% |
| 20% | B, internas | 36.160 | 303.049 | 0 | 1.152.292 | 31,19% |
| 20% | A, 100% export. | 36.160 | −36.160 | 0 | 2.041.225 | 8,97% |
| 20% | Simples I (vedado), A | 0 | 3.280 | 36.160 | 1.128.068 | 31,85% |
| 50% | A, internas | 90.400 | 280.240 | 0 | 1.393.225 | 31,52% |
| 50% | B, internas | 90.400 | 248.809 | 0 | 1.152.292 | 31,19% |
| 50% | A, 100% export. | 90.400 | −90.400 | 0 | 2.041.225 | 8,97% |
| 50% | Simples I (vedado), A | 0 | 3.280 | 90.400 | 1.079.252 | 33,07% |
| 80% | A, internas | 144.640 | 226.000 | 0 | 1.393.225 | 31,52% |
| 80% | B, internas | 144.640 | 194.569 | 0 | 1.152.292 | 31,19% |
| 80% | A, 100% export. | 144.640 | −144.640 | 0 | 2.041.225 | 8,97% |
| 80% | Simples I (vedado), A | 0 | 3.280 | 144.640 | 1.038.661 | 34,09% |

**S1:**
- Com créditos integralmente aproveitáveis, a proporção C_cred/C **não muda** o líquido nem a carga. Muda o IBS/CBS recolhido (e o saldo a ressarcir na exportação).
- Ela só pesa:
  - no Simples, que perde o crédito (−R$ 36 mil a −R$ 145 mil);
  - em caso de glosa de crédito por fornecedor irregular ou documento inidôneo (art. 47 § 1º; art. 48), quando o crédito perdido vira custo;
  - em ateliê residencial ou locador PF não contribuinte (art. 57 § 1º, I; art. 4º § 6º).

#### S2. Sensibilidade: ICMS sobre base com IBS/CBS (posição SEFAZ-SP) — 2027, m = 60%

| Cenário | Hip. | ICMS (base R) | ICMS (posição SP) | Preço | Preço (SP) | Líquido | Líquido (SP) | Δ |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| 1. PF residente (ICMS SP 18%) | A | 720.000 | 785.385 | 4.370.640 | 4.363.251 | 1.214.157 | 1.166.753 | −47.404 |
| 1. PF residente (ICMS SP 18%) | B | 658.942 | 720.000 | 4.000.000 | 4.000.000 | 1.012.498 | 959.950 | −52.548 |
| 2. PJ presumido comercial (8%/12%) | A | 720.000 | 785.385 | 4.370.640 | 4.363.251 | 1.393.225 | 1.334.378 | −58.847 |
| 2. PJ presumido comercial (8%/12%) | B | 658.942 | 720.000 | 4.000.000 | 4.000.000 | 1.152.292 | 1.102.747 | −49.545 |
| 4. PJ lucro real | A | 720.000 | 785.385 | 4.370.640 | 4.363.251 | 1.114.344 | 1.071.173 | −43.170 |
| 4. PJ lucro real | B | 658.942 | 720.000 | 4.000.000 | 4.000.000 | 930.684 | 894.457 | −36.227 |

#### S3. Sensibilidade: alíquota de referência da CBS 2027 (hipóteses A e B) — PJ presumido comercial, m = 60%

| Referência | CBS cobrada | Hip. | R | Preço | IBS+CBS destacado | Líquido ao sócio | Carga c/ IBS-CBS s/ preço |
|---|---:|---:|---:|---:|---:|---:|---:|
| 9,3% | 9,2% | A | 4.000.000 | 4.305.040 | 305.040 | 1.393.225 | 30,47% |
| 9,3% | 9,2% | B | 3.716.574 | 4.000.000 | 283.426 | 1.191.913 | 30,20% |
| 10,0% | 9,9% | A | 4.000.000 | 4.328.000 | 328.000 | 1.393.225 | 30,84% |
| 10,0% | 9,9% | B | 3.696.858 | 4.000.000 | 303.142 | 1.177.909 | 30,55% |
| 11,3% | 11,2% | A | 4.000.000 | 4.370.640 | 370.640 | 1.393.225 | 31,52% |
| 11,3% | 11,2% | B | 3.660.791 | 4.000.000 | 339.209 | 1.152.292 | 31,19% |

#### S4. Sensibilidade: ISS 5% × 2% e glosa de livro-caixa (PF) — 2027, A

| Cenário | m | Variação | Líquido base | Líquido variante | Δ |
|---|---:|---:|---:|---:|---:|
| PJ serviços | 30% | ISS 5% → 2% | 545.057 | 665.057 | 120.000 |
| PJ serviços | 60% | ISS 5% → 2% | 1.580.425 | 1.688.425 | 108.000 |
| PJ serviços | 90% | ISS 5% → 2% | 2.660.425 | 2.768.425 | 108.000 |
| PF (IRPFM líquida) | 30% | glosa de 10% de C | 344.157 | 267.157 | −77.000 |
| PF (IRPFM líquida) | 60% | glosa de 10% de C | 1.214.157 | 1.170.157 | −44.000 |
| PF (IRPFM líquida) | 90% | glosa de 10% de C | 2.084.157 | 2.073.157 | −11.000 |

#### S5. Distribuição × reinvestimento (PJ presumido comercial, 2027, A)

| m | Distribuído | Dividendos | IRRF | IRPFM | Retido na PJ | Tributos no ano |
|---|---:|---:|---:|---:|---:|---:|
| 30% | 100% | 258.752 | 0 | 0 | 0 | 862.943 |
| 30% | 50% | 129.376 | 0 | 0 | 129.376 | 862.943 |
| 30% | 0% | 0 | 0 | 0 | 258.752 | 862.943 |
| 60% | 100% | 1.458.752 | 145.875 | 143.832 | 0 | 1.006.775 |
| 60% | 50% | 729.376 | 72.938 | 19.794 | 729.376 | 882.737 |
| 60% | 0% | 0 | 0 | 0 | 1.458.752 | 862.943 |
| 90% | 100% | 2.658.752 | 265.875 | 263.832 | 0 | 1.126.775 |
| 90% | 50% | 1.329.376 | 132.938 | 130.895 | 1.329.376 | 993.837 |
| 90% | 0% | 0 | 0 | 0 | 2.658.752 | 862.943 |

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

#### I. Crédito de estoque × importação 2027 — lote VA R$ 1.000.000 (PJ presumido, SP)

| Item | Dez/2026 (PIS/Cofins-Imp.) | 2027 (IBS/CBS na base do ICMS) | 2027 (ICMS sem IBS/CBS) | 2027, II 2,4% (UE) |
|---|---:|---:|---:|---:|
| II | 36.000 | 36.000 | 36.000 | 24.000 |
| PIS/Cofins-Importação | 117.500 | 0 | 0 | 0 |
| CBS-importação | 0 | 116.032 | 116.032 | 114.688 |
| IBS-importação | 0 | 1.036 | 1.036 | 1.024 |
| ICMS-importação SP | 253.207 | 253.112 | 227.415 | 250.181 |
| Desembolso total | 406.707 | 406.180 | 380.483 | 389.893 |
| % do VA | 40,67% | 40,62% | 38,05% | 38,99% |

| Alternativa | Desembolso inicial | Pior posição de caixa acumulada | Custo final (não recuperado) | Custo financeiro ilustr. (1% a.m.) |
|---|---:|---:|---:|---:|
| (b) Importa dez/2026; crédito de estoque aceito; há débitos de CBS | 406.707 | −406.707 | 36.000 | 16.745 |
| (b') Importa dez/2026; crédito glosado (bem 'novo'? inventário?) | 406.707 | −406.707 | 153.500 | 25.557 |
| (b'') Importa dez/2026; PJ 100% exportadora (sem débito de CBS) | 406.707 | −406.707 | 153.500 | 25.557 |
| (c) Importa jan/2027 (CBS/IBS creditáveis e ressarcíveis) | 406.180 | −406.180 | 36.000 | 8.742 |

| Mês | Fluxo — importação 2026 | Acumulado 2026 | Fluxo — importação 2027 | Acumulado 2027 |
|---|---:|---:|---:|---:|
| dez/26 | −406.707 | −406.707 | 0 | 0 |
| jan/27 | 253.207 | −153.500 | −406.180 | −406.180 |
| fev/27 | 9.792 | −143.708 | 370.180 | −36.000 |
| mar/27 | 9.792 | −133.917 | 0 | −36.000 |
| abr/27 | 9.792 | −124.125 | 0 | −36.000 |
| mai/27 | 9.792 | −114.333 | 0 | −36.000 |
| jun/27 | 9.792 | −104.542 | 0 | −36.000 |
| jul/27 | 9.792 | −94.750 | 0 | −36.000 |
| ago/27 | 9.792 | −84.958 | 0 | −36.000 |
| set/27 | 9.792 | −75.167 | 0 | −36.000 |
| out/27 | 9.792 | −65.375 | 0 | −36.000 |
| nov/27 | 9.792 | −55.583 | 0 | −36.000 |
| dez/27 | 9.792 | −45.792 | 0 | −36.000 |
| jan/28 | 9.792 | −36.000 | 0 | −36.000 |

(a) Sem crédito (obras integralizadas pela PF, ou vindas da PF/empresa estrangeira sem PIS/Cofins): crédito de estoque = 0; a CBS da venda é integral (sem efeito no lucro na hipótese A).

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

#### G. Integralização de lote (VM R$ 2.000.000, custo ≈ 0) vendido em 2027 dentro de R = 4.000.000 (A, internas)

| Regime | m | Alternativa | GC na PF | Lucro contábil | IRPJ+CSLL | t_PJ | Dividendos | Redução de capital | IRRF | t_PF | Redutor | IRPFM | Tributos s/ renda (c/ GC) | Líquido ao sócio |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| 2. PJ presumido comercial (8%/12%) | 30% | (a) aporte pelo custo | 0 | 357.952 | 99.200 | 27,71% | 258.752 | 0 | 0 | 0,00% | 0 | 0 | 111.414 | 337.057 |
| 2. PJ presumido comercial (8%/12%) | 30% | (b) aporte a mercado | 300.000 | −1.642.048 | 99.200 | n/a (LC ≤ 0) | 0 | 258.752 | 0 | 0,00% | 0 | 0 | 411.414 | 37.057 |
| 2. PJ presumido comercial (8%/12%) | 60% | (a) aporte pelo custo | 0 | 1.557.952 | 99.200 | 6,37% | 1.458.752 | 0 | 145.875 | 9,86% | 0 | 143.832 | 255.246 | 1.393.225 |
| 2. PJ presumido comercial (8%/12%) | 60% | (b) aporte a mercado | 300.000 | −442.048 | 99.200 | n/a (LC ≤ 0) | 0 | 1.458.752 | 0 | 0,00% | 0 | 0 | 411.414 | 1.237.057 |
| 2. PJ presumido comercial (8%/12%) | 90% | (a) aporte pelo custo | 0 | 2.757.952 | 99.200 | 3,60% | 2.658.752 | 0 | 265.875 | 9,92% | 0 | 263.832 | 375.246 | 2.473.225 |
| 2. PJ presumido comercial (8%/12%) | 90% | (b) aporte a mercado | 300.000 | 757.952 | 99.200 | 13,09% | 658.752 | 2.000.000 | 65.875 | 1,23% | 0 | 8.123 | 419.537 | 2.428.934 |
| 4. PJ lucro real | 30% | (a) aporte pelo custo | 0 | 357.952 | 97.704 | 27,30% | 260.248 | 0 | 0 | 0,00% | 0 | 0 | 109.917 | 338.554 |
| 4. PJ lucro real | 30% | (b) aporte a mercado | 300.000 | −1.642.048 | 0 | n/a (LC ≤ 0) | 0 | 357.952 | 0 | 0,00% | 0 | 0 | 312.214 | 136.257 |
| 4. PJ lucro real | 60% | (a) aporte pelo custo | 0 | 1.557.952 | 505.704 | 32,46% | 1.052.248 | 0 | 105.225 | 8,96% | 78.116 | 16.210 | 534.127 | 1.114.344 |
| 4. PJ lucro real | 60% | (b) aporte a mercado | 300.000 | −442.048 | 0 | n/a (LC ≤ 0) | 0 | 1.557.952 | 0 | 0,00% | 0 | 0 | 312.214 | 1.336.257 |
| 4. PJ lucro real | 90% | (a) aporte pelo custo | 0 | 2.757.952 | 913.704 | 33,13% | 1.844.248 | 0 | 184.425 | 9,89% | 166.333 | 16.049 | 941.966 | 1.906.505 |
| 4. PJ lucro real | 90% | (b) aporte a mercado | 300.000 | 757.952 | 233.704 | 30,83% | 524.248 | 2.000.000 | 0 | 0,00% | 0 | 0 | 545.917 | 2.302.554 |

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

#### F. Empresa francesa mantida — por € 100 de lucro antes do IS (ilustrativo)

| Estrutura | IS francês | Retenção FR | IR Brasil (após crédito) | Carga sem IRPFM | IRPFM potencial | Carga c/ IRPFM (IR 14.754 após crédito) | Carga c/ IRPFM (IR 14.754 antes do crédito) |
|---|---:|---:|---:|---:|---:|---:|---:|
| PF detém a francesa — disponibilização (Lei 14.754 art. 6º) | 25,00 | 9,60 | 1,65 | 36,25 | 5,85 | 42,10 | 36,25 |
| PF detém a francesa — regime anual (art. 6º-A) | 25,00 | 9,60 | 0,00 | 34,60 | 7,50 | 42,10 | 34,60 |
| PJ brasileira (lucro real) detém a francesa; distribui ao sócio | 25,00 | 11,25 | 0,00 | 36,25 | 6,38 | 42,62 | 42,62 |

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

#### P. Regime pleno 2033 — ILUSTRATIVO, alíquota ESTIMADA, ICMS/ISS extintos, m = 60%, vendas internas

| CBS+IBS (est.) | Cenário | Hip. | Alíquota | R | Preço | IBS+CBS destacado | Líquido | Carga c/ IBS-CBS s/ preço |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| 26,5% | 1. PF residente (sem ICMS) | A | cheia | 4.000.000 | 5.060.000 | 1.060.000 | 1.736.157 | 34,07% |
| 26,5% | 1. PF residente (sem ICMS) | A | −60% | 4.000.000 | 4.424.000 | 424.000 | 1.736.157 | 24,59% |
| 26,5% | 1. PF residente (sem ICMS) | B | cheia | 3.162.055 | 4.000.000 | 837.945 | 1.128.647 | 31,78% |
| 26,5% | 1. PF residente (sem ICMS) | B | −60% | 3.616.637 | 4.000.000 | 383.363 | 1.458.219 | 23,54% |
| 26,5% | 2. PJ presumido comercial (8%/12%) | A | cheia | 4.000.000 | 5.060.000 | 1.060.000 | 2.041.225 | 28,04% |
| 26,5% | 2. PJ presumido comercial (8%/12%) | A | −60% | 4.000.000 | 4.424.000 | 424.000 | 2.041.225 | 17,69% |
| 26,5% | 2. PJ presumido comercial (8%/12%) | B | cheia | 3.162.055 | 4.000.000 | 837.945 | 1.310.303 | 27,24% |
| 26,5% | 2. PJ presumido comercial (8%/12%) | B | −60% | 3.616.637 | 4.000.000 | 383.363 | 1.706.825 | 17,33% |
| 26,5% | 4. PJ lucro real | A | cheia | 4.000.000 | 5.060.000 | 1.060.000 | 1.589.661 | 36,96% |
| 26,5% | 4. PJ lucro real | A | −60% | 4.000.000 | 4.424.000 | 424.000 | 1.589.661 | 27,90% |
| 26,5% | 4. PJ lucro real | B | cheia | 3.162.055 | 4.000.000 | 837.945 | 1.036.470 | 34,09% |
| 26,5% | 4. PJ lucro real | B | −60% | 3.616.637 | 4.000.000 | 383.363 | 1.336.590 | 26,59% |
| 28,0% | 1. PF residente (sem ICMS) | A | cheia | 4.000.000 | 5.120.000 | 1.120.000 | 1.736.157 | 34,84% |
| 28,0% | 1. PF residente (sem ICMS) | A | −60% | 4.000.000 | 4.448.000 | 448.000 | 1.736.157 | 25,00% |
| 28,0% | 1. PF residente (sem ICMS) | B | cheia | 3.125.000 | 4.000.000 | 875.000 | 1.101.782 | 32,46% |
| 28,0% | 1. PF residente (sem ICMS) | B | −60% | 3.597.122 | 4.000.000 | 402.878 | 1.444.071 | 23,90% |
| 28,0% | 2. PJ presumido comercial (8%/12%) | A | cheia | 4.000.000 | 5.120.000 | 1.120.000 | 2.041.225 | 28,88% |
| 28,0% | 2. PJ presumido comercial (8%/12%) | A | −60% | 4.000.000 | 4.448.000 | 448.000 | 2.041.225 | 18,14% |
| 28,0% | 2. PJ presumido comercial (8%/12%) | B | cheia | 3.125.000 | 4.000.000 | 875.000 | 1.277.980 | 28,05% |
| 28,0% | 2. PJ presumido comercial (8%/12%) | B | −60% | 3.597.122 | 4.000.000 | 402.878 | 1.689.803 | 17,75% |
| 28,0% | 4. PJ lucro real | A | cheia | 4.000.000 | 5.120.000 | 1.120.000 | 1.589.661 | 37,70% |
| 28,0% | 4. PJ lucro real | A | −60% | 4.000.000 | 4.448.000 | 448.000 | 1.589.661 | 28,29% |
| 28,0% | 4. PJ lucro real | B | cheia | 3.125.000 | 4.000.000 | 875.000 | 1.012.003 | 34,70% |
| 28,0% | 4. PJ lucro real | B | −60% | 3.597.122 | 4.000.000 | 402.878 | 1.323.707 | 26,91% |

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

#### V. Verificações contra as notas

| Verificação | Modelo | Nota/esperado | Resultado |
|---|---:|---:|---:|
| Presumido comércio, trimestre R$ 1 mi: IRPJ+CSLL+PIS/Cofins | 61.300,00 | 61.300,00 | OK |
| Presumido serviços, trimestre R$ 1 mi: IRPJ+CSLL+PIS/Cofins | 139.300,00 | 139.300,00 | OK |
| Carga efetiva presumido comercial (6,13%) ×10.000 | 613,00 | 613,00 | OK |
| Presumido misto 50/50, trimestre | 100.300,00 | 100.300,00 | OK |
| Comércio 100% exportado: carga ×10.000 (2,48%) | 248,00 | 248,00 | OK |
| Nota A4 real 30%: D | 816.000,00 | 816.000,00 | OK |
| Nota A4 real 30%: redutor | 13.056,00 | 13.056,00 | OK |
| Nota A4 real 30%: IRPFM final | 16.320,00 | 16.320,00 | OK |
| Nota A4 real 30%: saldo DAA | -65.280,00 | -65.280,00 | OK |
| Nota A4 serv 30%: D | 788.800,00 | 788.800,00 | OK |
| Nota A4 serv 30%: redutor | 26.924,37 | 26.924,00 | OK |
| Nota A4 serv 30%: IRPFM final | 0,00 | 0,00 | OK |
| Nota A4 serv 30%: saldo DAA | -78.880,00 | -78.880,00 | OK |
| Nota A4 com 30%: D | 1.100.800,00 | 1.100.800,00 | OK |
| Nota A4 com 30%: redutor | 0,00 | 0,00 | OK |
| Nota A4 com 30%: IRPFM final | 91.880,11 | 91.880,00 | OK |
| Nota A4 com 30%: saldo DAA | -18.199,89 | -18.200,00 | OK |
| Nota A4 real 60%: D | 1.608.000,00 | 1.608.000,00 | OK |
| Nota A4 real 60%: redutor | 144.720,00 | 144.720,00 | OK |
| Nota A4 real 60%: IRPFM final | 16.080,00 | 16.080,00 | OK |
| Nota A4 real 60%: saldo DAA | -144.720,00 | -144.720,00 | OK |
| Nota A4 serv 60%: D | 1.988.800,00 | 1.988.800,00 | OK |
| Nota A4 serv 60%: redutor | 0,00 | 0,00 | OK |
| Nota A4 serv 60%: IRPFM final | 198.880,00 | 198.880,00 | OK |
| Nota A4 serv 60%: saldo DAA | -0,00 | 0,00 | OK |
| Nota A4 com 60%: D | 2.300.800,00 | 2.300.800,00 | OK |
| Nota A4 com 60%: redutor | 0,00 | 0,00 | OK |
| Nota A4 com 60%: IRPFM final | 230.080,00 | 230.080,00 | OK |
| Nota A4 com 60%: saldo DAA | -0,00 | 0,00 | OK |
| Nota A4 real 90%: D | 2.400.000,00 | 2.400.000,00 | OK |
| Nota A4 real 90%: redutor | 224.000,00 | 224.000,00 | OK |
| Nota A4 real 90%: IRPFM final | 16.000,00 | 16.000,00 | OK |
| Nota A4 real 90%: saldo DAA | -224.000,00 | -224.000,00 | OK |
| Nota A4 serv 90%: D | 3.188.800,00 | 3.188.800,00 | OK |
| Nota A4 serv 90%: redutor | 0,00 | 0,00 | OK |
| Nota A4 serv 90%: IRPFM final | 318.880,00 | 318.880,00 | OK |
| Nota A4 serv 90%: saldo DAA | 0,00 | 0,00 | OK |
| Nota A4 com 90%: D | 3.500.800,00 | 3.500.800,00 | OK |
| Nota A4 com 90%: redutor | 0,00 | 0,00 | OK |
| Nota A4 com 90%: IRPFM final | 350.080,00 | 350.080,00 | OK |
| Nota A4 com 90%: saldo DAA | 0,00 | 0,00 | OK |
| Ex. pró-labore: IRPF devido DAA s/ pró-labore | 12.213,65 | 12.213,65 | OK |
| Ex. pró-labore: IRRF mensal s/ pró-labore | 1.165,66 | 1.165,66 | OK |
| Ex. pró-labore (real 60%): lucro L | 2.277.952,08 | 2.277.952,08 | OK |
| Ex. pró-labore: IRPJ | 545.488,02 | 545.488,02 | OK |
| Ex. pró-labore: CSLL | 205.015,69 | 205.015,69 | OK |
| Ex. pró-labore: dividendos D | 1.527.448,37 | 1.527.448,37 | OK |
| Ex. pró-labore: redutor | 134.608,98 | 134.608,98 | OK |
| Ex. pró-labore: IRPFM | 16.092,86 | 16.092,86 | OK |
| Ex. pró-labore: restituição (IRRF − IRPFM) | 136.651,98 | 136.651,98 | OK |
| Simples III 30%: IRPJ+CSLL no DAS | 334.868,40 | 334.868,00 | OK |
| Simples III 30%: IRPFM | 38.228,95 | 38.229,00 | OK |
| Simples III 30%: restituição | 48.284,21 | 48.284,00 | OK |
| Simples I 2027: alíquota efetiva ×10.000 (9,45%) | 945,00 | 945,00 | OK |
| IRPF exemplo RT 70.000 (simplificado) | 2.755,86 | 2.755,86 | OK |
| Importação 2026 (VA 1 mi): total | 406.707,32 | 406.707,32 | OK |
| Importação 2026: ICMS | 253.207,32 | 253.207,32 | OK |
| Importação 2026, II 3,2%: total | 401.829,27 | 401.829,00 | OK |
| Importação 2027 (IBS/CBS na base do ICMS): total | 406.180,49 | 406.180,00 | OK |
| Importação 2027 (sem IBS/CBS na base do ICMS): total | 380.482,63 | 380.483,00 | OK |
| Importação 2027, II 2,4%: total | 389.892,68 | 389.893,00 | OK |
| Importação 2027, CBS 9,0% (ref. 9,1%): total | 378.385,37 | 378.385,00 | OK |
| Importação 2027, CBS 12,5% (ref. 12,6%): total | 422.604,88 | 422.605,00 | OK |
| França disponibilização: carga (36,25) | 36,25 | 36,25 | OK |
| França regime anual: carga (34,6) | 34,60 | 34,60 | OK |
| CBS 2027 sobre V = 1 mi | 112.000,00 | 112.000,00 | OK |
| CBS 2027 reduzida 60% sobre V = 1 mi | 44.800,00 | 44.800,00 | OK |
| Integralização ex.: IRPJ+CSLL presumido R$ 4 mi | 99.200,00 | 99.200,00 | OK |
| Integralização ex.: GC 15% × 3,95 mi | 592.500,00 | 592.500,00 | OK |
| Hipótese B: R pelo modelo × fórmula fechada | 3.660.791,10 | 3.660.791,10 | OK |
| Hipótese B: preço recomposto = 4.000.000 | 4.000.000,00 | 4.000.000,00 | OK |

Total: 71 OK de 71.

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
