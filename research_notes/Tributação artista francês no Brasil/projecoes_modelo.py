#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Projeções tributárias — artista plástico francês residente fiscal no Brasil (PF × PJ).
Ano de referência 2027 (primeiro ano com CBS), comparação com 2026 e quadro ilustrativo de 2033.

Python 3 puro, sem bibliotecas externas, determinístico.
Uso:  python3 -I projecoes_modelo.py            -> imprime verificações e todas as tabelas (Markdown)
      python3 -I projecoes_modelo.py --checks   -> só as verificações contra as notas

Parâmetros: todos no bloco 1, cada um com dispositivo/fonte e status:
  [REGRA EXPRESSA]        texto legal/regulamentar vigente em 19/11/2026
  [CÁLCULO TCU-PENDENTE]  cálculo técnico do TCU ainda sem resolução do Senado
  [ESTIMATIVA]            valor não definitivo, proposta, dado de mercado ou parâmetro ilustrativo
  [INTERPRETAÇÃO]         leitura jurídica defensável ou simplificação de modelagem
  [PREMISSA DO CASO]      dado do caso fornecido pela coordenação
Fontes: notas da pasta "Tributação artista francês no Brasil" (data de referência 19/11/2026).

DEFINIÇÕES (iguais às da memória de cálculo):
  R   = receita anual antes do IBS/CBS ("por fora"), incluindo ICMS/ISS e, em 2026, PIS/Cofins ("por dentro").
  Preço pago pelo comprador = R + IBS + CBS; base do IBS/CBS = R − ICMS − ISS (LC 214, art. 12, § 2º, V).
  m   = (R − C)/R, C = custos e despesas operacionais antes de tributos sobre consumo (líquidos de créditos),
        antes de tributos sobre a renda e antes de qualquer remuneração do artista. C fica fixo em reais:
        C = (1 − m) × R$ 4.000.000 nas duas hipóteses de preço.
  C = C_cred (gera crédito de IBS/CBS) + C_nc (folha e encargos dos colaboradores; sem crédito).
  L0  = R − C − tributos sobre consumo absorvidos  (lucro antes de tributos sobre a renda e da remuneração
        do artista; base da "carga sobre o lucro").
  Hipótese A: R = 4.000.000 (repasse integral do IBS/CBS).  Hipótese B: preço total = 4.000.000 (= 2026).
"""
import sys

# =============================================================================
# 1. PARÂMETROS
# =============================================================================

# ---- 1.1 Premissas do caso ---------------------------------------------------
RECEITA_REF = 4_000_000.00      # [PREMISSA DO CASO] receita anual; igual nos 4 trimestres e 12 meses
PRECO_REF_B = 4_000_000.00      # [PREMISSA DO CASO] hipótese B: total pago pelo comprador = o de 2026
MARGENS = (0.30, 0.60, 0.90)    # [PREMISSA DO CASO] margens operacionais m = (R − C)/R
FRAC_C_CRED = 0.50              # [PREMISSA DO CASO] C_cred/C no caso-base (materiais, molduras, aluguel a
                                #   locador contribuinte, fretes, serviços e comissões de PJ)
SENS_FRAC_C_CRED = (0.20, 0.50, 0.80)  # [PREMISSA DO CASO] sensibilidade pedida

# ---- 1.2 CBS/IBS ----------------------------------------------------------------
CBS_REF_2027 = 0.113            # [CÁLCULO TCU-PENDENTE] alíquota de referência da CBS 2027: Acórdão TCU
                                #   2.933/2026-Plenário (11,3468% arredondado, LC 214 art. 349 § 14); Senado
                                #   pode fixá-la até 15/12/2026 (LC 214 art. 353 § 2º); sem resolução, vale o
                                #   cálculo do TCU (art. 349 § 2º — leitura pública de Senado/TCU/Fazenda)
REDUCAO_CBS_2027_28 = 0.001     # [REGRA EXPRESSA] ADCT art. 127 p.ú.; LC 214 art. 347 (−0,1 p.p. em 2027-2028)
IBS_2027_28 = 0.001             # [REGRA EXPRESSA] ADCT art. 127; LC 214 art. 344 (0,05% UF + 0,05% município)
# => CBS 2027 = 11,3% − 0,1 p.p. = 11,2%; IBS 0,1%; total "por fora" t = 11,3% (modelo usa t = CBS_REF_2027)
CBS_2026, IBS_2026 = 0.009, 0.001  # [REGRA EXPRESSA] LC 214 arts. 343 e 346 (ano-teste)
DISPENSA_IBSCBS_2026 = True     # [REGRA EXPRESSA] LC 214 art. 348 § 1º (dispensa para quem cumpre obrigações
                                #   acessórias); PF só obrigada a CNPJ/documento fiscal a partir de 2027
                                #   (Dec. 12.955 arts. 105 § 4º-A e 115 § 3º) [INTERPRETAÇÃO: 2026 = sem IBS/CBS]
REDUCAO_ART139 = 0.60           # [REGRA EXPRESSA] LC 214 art. 139, VIII, e § 3º; Anexo X itens 43-45: só obras
                                #   "produzidas por artistas brasileiros" -> francês: alíquota cheia;
                                #   nato/naturalizado: reduzida (redução do 0,1 p.p. proporcional, art. 347 § 1º, I)
SENS_CBS_REF = (0.093, 0.100, 0.113)  # [ESTIMATIVA] referência alternativa se o Senado reduzir (hiato de
                                #   conformidade; nota de alíquotas §1, Inferences) — não normativo
T_2033 = (0.265, 0.280)         # [ESTIMATIVA] CBS+IBS de referência em 2033: 26,5% = gatilho do art. 475 § 11
                                #   da LC 214 (NÃO é teto nem alíquota); ~28% = estimativa da Fazenda após as
                                #   emendas do Congresso (nota de alíquotas §1, "valores não reverificados")

# ---- 1.3 ICMS / ISS ------------------------------------------------------------------
ICMS_SP = 0.18                  # [REGRA EXPRESSA] RICMS/SP art. 52, I; isenção do autor (Anexo I art. 128)
                                #   vigorou até 31/12/2024 (Dec. 67.383/2022; RC 32.371/2025); "por dentro"
ICMS_UF_ISENCAO = 0.0           # [REGRA EXPRESSA estadual] MG (RICMS/2023 Anexo X item 39: obra "sem utilização de
                                #   trabalho assalariado" -> provavelmente inaplicável), RS (art. 9º XXXII), BA
                                #   (art. 265 XXVIII): só PF autora, com estabelecimento efetivo na UF
ISS_CONSERV = 0.05              # [REGRA EXPRESSA quanto ao teto] LC 116 art. 8º, II; alíquota de SP para o
                                #   subitem 40.01 NÃO confirmada (Lei SP 13.701/2003 não lida)
ISS_MINIMO = 0.02               # [REGRA EXPRESSA] LC 116 art. 8º-A (sensibilidade)
ICMS_BASE_INCLUI_IBSCBS = False # Caso-base [INTERPRETAÇÃO]: ICMS sobre R (LC 87 art. 13 não inclui IBS/CBS; é a
                                #   definição pedida). Sensibilidade: posição SEFAZ-SP (RCs 32.303/2025,
                                #   32.931/2025, 33.083/2026): IBS/CBS "efetivamente exigíveis" integram a base do ICMS

# ---- 1.4 PIS/Cofins (só 2026) ---------------------------------------------------------
PIS_COFINS_CUM = 0.0365         # [REGRA EXPRESSA] 0,65% + 3% (Lei 9.718; Lei 10.833 art. 10, II) — presumido
PIS_COFINS_NC = 0.0925          # [REGRA EXPRESSA] 1,65% + 7,6% (Leis 10.637/10.833) — lucro real, com créditos
EXCLUI_ICMS_BASE_PISCOFINS = True  # [INTERPRETAÇÃO] STF Tema 69 (RE 574.706): ICMS destacado fora da base.
                                #   Fora das notas (conhecimento geral); a nota de PJ calcula 3,65% sobre a receita
                                #   sem ICMS (exemplo puramente federal). Exportação: isenta (MP 2.158-35 art. 14).

# ---- 1.5 IRPJ / CSLL ------------------------------------------------------------------------
IRPJ_ALIQ = 0.15                # [REGRA EXPRESSA] Lei 9.249 art. 3º
IRPJ_ADIC = 0.10                # [REGRA EXPRESSA] Lei 9.249 art. 3º § 1º
IRPJ_ADIC_LIM_MES = 20_000.00   # [REGRA EXPRESSA] R$ 20 mil/mês (60 mil/trimestre; 240 mil/ano)
CSLL_ALIQ = 0.09                # [REGRA EXPRESSA] Lei 7.689 art. 3º, III
PRES_IRPJ_COM, PRES_CSLL_COM = 0.08, 0.12    # [REGRA EXPRESSA] Lei 9.249 arts. 15 e 20, III (venda de obra própria
                                #   em estoque = 8%/12%: [INTERPRETAÇÃO] forte, sem ato específico — nota PJ §1)
PRES_IRPJ_SERV, PRES_CSLL_SERV = 0.32, 0.32  # [REGRA EXPRESSA] art. 15 § 1º, III; art. 20, I (encomenda 40.01 e
                                #   licenciamento: [INTERPRETAÇÃO], SC Cosit 238/2024 e 18/2025 por analogia)
LC224_LIMITE = 5_000_000.00     # [REGRA EXPRESSA] LC 224 art. 4º § 5º; IN RFB 2.305 art. 15 (R$ 1,25 mi/trim.)
LC224_ACRESCIMO = 0.10          # [REGRA EXPRESSA] +10% nos percentuais só sobre a receita acima do limite
NOMINAL_IRPJ_CSLL = 0.34        # [REGRA EXPRESSA] Lei 9.250 art. 16-B § 1º (limite do redutor)

# ---- 1.6 Previdência -----------------------------------------------------------------------
TETO_INSS_MENSAL = 8_475.55     # [REGRA EXPRESSA p/ 2026: Port. Interm. MPS/MF 13/2026] [ESTIMATIVA p/ 2027: teto
                                #   2027 não publicado; usa-se o de 2026]
INSS_CI = 0.20                  # [REGRA EXPRESSA] Lei 8.212 art. 21 (contribuinte individual por conta própria)
INSS_SOCIO = 0.11               # [REGRA EXPRESSA] Lei 8.212 art. 30 § 4º (20% − 9%), até o teto
CPP = 0.20                      # [REGRA EXPRESSA] Lei 8.212 art. 22, III (sobre pró-labore, sem teto)
PRO_LABORE_MENSAL = TETO_INSS_MENSAL  # [PREMISSA DO CASO] pró-labore no teto do INSS

# ---- 1.7 IRPF (tabela anual do exercício 2027/AC 2026; sem tabela 2027 distinta) ---------------
TABELA_IRPF_ANUAL = (           # [REGRA EXPRESSA] Lei 15.191/2025; RFB "Tributação de 2026"
    (29_145.60, 0.000, 0.00),   #   [INTERPRETAÇÃO] mantida para 2027 por falta de lei nova
    (33_919.80, 0.075, 2_185.92),
    (45_012.60, 0.150, 4_729.91),
    (55_976.16, 0.225, 8_105.85),
    (float("inf"), 0.275, 10_904.66),
)
DESC_SIMPL_PCT, DESC_SIMPL_LIM = 0.20, 17_640.00   # [REGRA EXPRESSA] Lei 9.250 art. 10, X
RED_LIM1, RED_MAX1 = 60_000.00, 2_694.15           # [REGRA EXPRESSA] Lei 9.250 art. 11-A (Lei 15.270)
RED_LIM2, RED_A, RED_B = 88_200.00, 8_429.73, 0.095575
TABELA_IRPF_MENSAL = ((2_428.80, 0, 0), (2_826.65, .075, 182.16), (3_751.05, .15, 394.16),
                      (4_664.68, .225, 675.49), (float("inf"), .275, 908.73))  # [REGRA EXPRESSA] (conferência)

# ---- 1.8 Lucros e dividendos / IRPFM (Lei 15.270/2025) -------------------------------------------
IRRF_DIV = 0.10                 # [REGRA EXPRESSA] Lei 9.250 art. 6º-A: 10% sobre o TOTAL do mês se > R$ 50 mil
IRRF_DIV_LIMIAR_MES = 50_000.00 # [REGRA EXPRESSA] por PJ, por sócio, por mês
IRPFM_PISO, IRPFM_TETO_REND = 600_000.00, 1_200_000.00  # [REGRA EXPRESSA] art. 16-A caput e § 2º
IRPFM_ALIQ_MAX = 0.10           # [REGRA EXPRESSA] alíquota = (REND/60.000 − 10)% entre 600 mil e 1,2 mi
PARCELAS_DISTRIBUICAO = 12      # [PREMISSA DO CASO] 100% do lucro em 12 parcelas mensais iguais
# Redutor (art. 16-B): D × max(0; t_PJ + t_PF − 34%); t_PF = acréscimo do IRPFM pela inclusão dos dividendos ÷ D
#   [INTERPRETAÇÃO] t_PF sobre o valor devido já líquido do IRPF da DAA (leitura literal); lucro contábil completo
#   (não o simplificado do § 6º); sem IN do redutor em 19/11/2026.

# ---- 1.9 Ganho de capital PF (Lei 8.981 art. 21, red. Lei 13.259/2016) -------------------------------
FAIXAS_GC = ((5_000_000.0, 0.15), (10_000_000.0, 0.175), (30_000_000.0, 0.20), (float("inf"), 0.225))  # [REGRA EXPRESSA]

# ---- 1.10 Simples Nacional 2027 (LC 214 art. 519, Anexos XVIII e XX) — só ilustrativo, VEDADO ----------
SIMPLES = {  # [REGRA EXPRESSA] 6ª faixa 2027-2028: nominal, parcela a deduzir, repartição (IRPJ, CSLL, CBS, CPP)
    "I":   dict(nom=0.189, pd=378_000.0, irpj=0.1358, csll=0.1006, cbs=0.3402, cpp=0.4234),
    "III": dict(nom=0.329, pd=648_000.0, irpj=0.3509, csll=0.1504, cbs=0.1929, cpp=0.3058),
}

# ---- 1.11 Importação de obras (NCM 9701.91.00) — nota importacao_exportacao_obras.md -------------------
VA_LOTE = 1_000_000.00          # [PREMISSA DO CASO] valor aduaneiro do lote (CIF)
II_NMF = 0.036                  # [REGRA EXPRESSA] TEC (Res. Gecex 948/2026) Cap. 97
II_MERCOSUL_UE_2027 = 0.024     # [ESTIMATIVA] cronograma "4" do ITA Mercosul–UE (aritmética da nota; não verificado
                                #   na ferramenta da Secex; exige prova de origem UE)
PIS_COFINS_IMP = 0.021 + 0.0965 # [REGRA EXPRESSA] Lei 10.865 art. 8º, I (11,75% sobre o VA; sem alíquota zero)
ICMS_IMP_SP = 0.18              # [REGRA EXPRESSA] "por dentro" (LC 87 art. 13, V e § 1º, I)
# Taxa Siscomex, AFRMM e despesas aduaneiras: não incluídas (nota: não verificadas no original)
TAXA_FIN_MENSAL = 0.01          # [ESTIMATIVA] custo de oportunidade ilustrativo (1% a.m.) — NÃO pesquisado

# ---- 1.12 Integralização -------------------------------------------------------------------------------------
LOTE_INTEGR_VM = 2_000_000.00   # [PREMISSA DO CASO] valor de mercado do lote integralizado
LOTE_INTEGR_CUSTO = 0.0         # [PREMISSA DO CASO] custo comprovado ≈ 0

# ---- 1.13 Empresa francesa mantida (por € 100 de lucro antes do IS) -------------------------------------------
FR_IS = 0.25                    # [REGRA EXPRESSA (dado geral FR)] taxa normal; 15% sobre os primeiros € 42.500
                                #   para PME elegível NÃO modelado (nota internacional, não verificado no original)
FR_RET_DIV_PF_NR = 0.128        # [REGRA EXPRESSA FR] CGI art. 187, 1-2° (PF não residente)
TRATADO_TETO_DIV = 0.15         # [REGRA EXPRESSA] Dec. 70.506/1972 art. X, 2
FR_RET_DIV_PJ_NR = 0.15         # [REGRA EXPRESSA] IS 25% reduzido a 15% pelo tratado (PJ não residente)
BR_IRPF_14754 = 0.15            # [REGRA EXPRESSA] Lei 14.754/2023 arts. 2º, 5º e 6º

# =============================================================================
# 2. FUNÇÕES DE CÁLCULO
# =============================================================================

def imposto_tabela(base, tabela=TABELA_IRPF_ANUAL):
    for lim, a, d in tabela:
        if base <= lim:
            return max(0.0, base * a - d)
    return 0.0


def irpf_anual(base, rend_trib):
    """IRPF da DAA (art. 12) com a redução do art. 11-A (depende dos rendimentos tributáveis, não da base)."""
    i0 = imposto_tabela(base)
    if rend_trib <= RED_LIM1:
        red = min(i0, RED_MAX1)
    elif rend_trib <= RED_LIM2:
        red = min(i0, max(0.0, RED_A - RED_B * rend_trib))
    else:
        red = 0.0
    return max(0.0, i0 - red)


def irpf_pro_labore(pl_anual):
    """IRPF devido na DAA sobre o pró-labore: menor entre desconto simplificado e dedução do INSS."""
    inss = INSS_SOCIO * min(pl_anual, 12 * TETO_INSS_MENSAL)
    simp = pl_anual - min(DESC_SIMPL_PCT * pl_anual, DESC_SIMPL_LIM)
    comp = pl_anual - inss
    return min(irpf_anual(simp, pl_anual), irpf_anual(comp, pl_anual))


def aliq_irpfm(rend):
    if rend <= IRPFM_PISO:
        return 0.0
    if rend >= IRPFM_TETO_REND:
        return IRPFM_ALIQ_MAX
    return (rend / 60_000.0 - 10.0) / 100.0


def irrf_dividendos(d_anual, parcelas=PARCELAS_DISTRIBUICAO):
    dm = d_anual / parcelas
    return parcelas * (IRRF_DIV * dm if dm > IRRF_DIV_LIMIAR_MES else 0.0)


def irpfm(rend_outros, irpf_devido, divs):
    """IRPFM anual (art. 16-A) com redutor (art. 16-B). divs = [(D, t_PJ), ...].
    Retorna dict com alíquota, devido antes do redutor, t_PF, redutor e IRPFM final."""
    soma_d = sum(d for d, _ in divs)
    rend = rend_outros + soma_d
    a = aliq_irpfm(rend)
    pre = max(0.0, a * rend - irpf_devido)
    pre_sem = max(0.0, aliq_irpfm(rend_outros) * rend_outros - irpf_devido)
    t_pf = (pre - pre_sem) / soma_d if soma_d > 0 else 0.0
    red = sum(d * max(0.0, tpj + t_pf - NOMINAL_IRPJ_CSLL) for d, tpj in divs)
    final = max(0.0, pre - red)
    return dict(rend=rend, aliq=a, pre=pre, t_pf=t_pf, redutor=red, redutor_ef=min(red, pre), irpfm=final)


def base_presumida(receita, pct):
    """Base presumida anual com a LC 224 (acréscimo de 10% só sobre a receita acima de R$ 5 mi)."""
    return pct * min(receita, LC224_LIMITE) + pct * (1 + LC224_ACRESCIMO) * max(0.0, receita - LC224_LIMITE)


def irpj_sobre_base(base_anual, trimestres=4):
    """IRPJ por trimestre (receita igual nos trimestres) × 4 — adicional sobre o que exceder R$ 60 mil/trim."""
    bq = base_anual / trimestres
    return trimestres * (IRPJ_ALIQ * bq + IRPJ_ADIC * max(0.0, bq - 3 * IRPJ_ADIC_LIM_MES))


def ganho_capital_pf(ganho):
    imp, ant = 0.0, 0.0
    for lim, a in FAIXAS_GC:
        if ganho > ant:
            imp += a * (min(ganho, lim) - ant)
        ant = lim
    return imp


def taxas_consumo(ano, cbs_ref, t2033, red139):
    """Retorna (t_debito, t_credito) do IBS+CBS "por fora"."""
    if ano == 2026:
        t = 0.0 if DISPENSA_IBSCBS_2026 else (CBS_2026 + IBS_2026)
        return t, t
    if ano in (2027, 2028):
        t_full = (cbs_ref - REDUCAO_CBS_2027_28) + IBS_2027_28
    else:  # regime pleno (ilustrativo)
        t_full = t2033
    fator = (1.0 - REDUCAO_ART139) if red139 else 1.0
    return t_full * fator, t_full


def simular(estr, m, ano=2027, hip="A", exp=0.0, aliq_local=None, red139=False, frac_cred=FRAC_C_CRED,
            cbs_ref=CBS_REF_2027, t2033=T_2033[0], icms_base_ibscbs=ICMS_BASE_INCLUI_IBSCBS,
            pf_irpfm_base="bruta", pl_mensal=PRO_LABORE_MENSAL, distrib=1.0, cmv_extra=0.0,
            glosa_lc=0.0, ganho_capital=0.0, cred_glosa=0.0):
    """estr: 'PF', 'PRES_COM', 'PRES_SERV', 'REAL', 'SIMPLES_I', 'SIMPLES_III'.
    exp = fração exportada (de R na hipótese A; do preço na hipótese B)."""
    r = dict(estr=estr, m=m, ano=ano, hip=hip, exp=exp)
    simples = estr.startswith("SIMPLES")
    tipo_local = "ISS" if estr == "PRES_SERV" else "ICMS"
    if aliq_local is None:
        aliq_local = ISS_CONSERV if tipo_local == "ISS" else ICMS_SP
    if ano >= 2033:
        aliq_local = 0.0
    t_deb, t_cred = taxas_consumo(ano, cbs_ref, t2033, red139)
    if simples:  # CBS dentro do DAS; IBS por fora acima do sublimite [INTERPRETAÇÃO]; créditos não aproveitados
        t_deb, t_cred = (IBS_2027_28 if ano in (2027, 2028) else 0.0), 0.0

    def local_de(rd):
        if tipo_local == "ICMS" and icms_base_ibscbs and t_deb > 0:
            return aliq_local * rd * (1 + t_deb) / (1 + aliq_local * t_deb)
        return aliq_local * rd

    C = (1.0 - m) * RECEITA_REF
    C_cred = frac_cred * C
    if hip == "A":
        R_dom, R_exp = (1 - exp) * RECEITA_REF, exp * RECEITA_REF
    else:  # B: preço total constante; R_dom = P_dom / k, k = preço por R$ 1 de R doméstico
        k = 1.0 + t_deb * (1.0 - local_de(1.0))
        R_dom, R_exp = (1 - exp) * PRECO_REF_B / k, exp * PRECO_REF_B
    R = R_dom + R_exp
    local = local_de(R_dom)                       # ICMS/ISS só nas vendas internas (exportação: imune/não incide)
    deb = t_deb * (R_dom - local)                 # IBS/CBS destacado
    cred = t_cred * C_cred * (1.0 - cred_glosa)   # créditos sobre C_cred (alíquota cheia dos fornecedores)
    perda_cred = (t_cred * C_cred * cred_glosa) + ((CBS_REF_2027 - REDUCAO_CBS_2027_28 + IBS_2027_28) * C_cred
                                                   if simples and ano in (2027, 2028) else 0.0)
    pis = 0.0
    if ano == 2026 and estr in ("PRES_COM", "PRES_SERV"):
        pis = PIS_COFINS_CUM * (R_dom - (local if EXCLUI_ICMS_BASE_PISCOFINS and tipo_local == "ICMS" else 0.0))
    if ano == 2026 and estr == "REAL":
        pis = PIS_COFINS_NC * (R_dom - (local if EXCLUI_ICMS_BASE_PISCOFINS else 0.0)) - PIS_COFINS_NC * C_cred
    preco = R + deb
    r.update(R=R, R_dom=R_dom, R_exp=R_exp, C=C, C_cred=C_cred, local=local, tipo_local=tipo_local,
             aliq_local=aliq_local, t_deb=t_deb, deb=deb, cred=cred, ibscbs_liq=deb - cred, pis=pis, preco=preco,
             perda_cred=perda_cred)

    # ---- Simples: DAS -------------------------------------------------------------------
    das = das_ir = das_cbs = das_cpp = 0.0
    if simples:
        p = SIMPLES[estr.split("_")[1]]
        ef = (R * p["nom"] - p["pd"]) / R
        das = ef * R
        das_ir, das_cbs, das_cpp = das * (p["irpj"] + p["csll"]), das * p["cbs"], das * p["cpp"]
        r.update(simples_ef=ef, das=das)
    cons_abs = local + pis + perda_cred + das_cbs      # tributos sobre consumo absorvidos pelo vendedor
    L0 = R - C - cons_abs
    r.update(cons_abs=cons_abs, L0=L0)

    T_renda = T_prev = 0.0
    if estr == "PF":
        inss = INSS_CI * min(12 * TETO_INSS_MENSAL, max(0.0, L0))
        rend_liq_lc = R - local - C * (1 - glosa_lc)            # receita − livro-caixa (C e ICMS/ISS dedutíveis)
        base = max(0.0, rend_liq_lc - inss)                     # INSS do CI dedutível na DAA (completo)
        ir = irpf_anual(base, R)
        rend_irpfm = R if pf_irpfm_base == "bruta" else rend_liq_lc
        a = aliq_irpfm(rend_irpfm)
        irpfm_v = max(0.0, a * rend_irpfm - ir)
        liquido = L0 - inss - ir - irpfm_v
        T_renda, T_prev = ir + irpfm_v, inss
        r.update(inss=inss, base_irpf=base, irpf=ir, rend_irpfm=rend_irpfm, aliq_irpfm=a, irpfm=irpfm_v,
                 LC=L0, caixa=liquido, liquido=liquido, irpj=0.0, csll=0.0, D=0.0, irrf=0.0, saldo=irpfm_v,
                 t_pj=0.0, t_pf=0.0, redutor=0.0, PL=0.0, cpp=0.0, red_capital=0.0)
    else:
        PL = 12 * pl_mensal
        cpp = 0.0 if simples else CPP * PL                       # no Simples a CPP está no DAS
        inss_s = INSS_SOCIO * min(PL, 12 * TETO_INSS_MENSAL)
        LC = L0 - PL - cpp - das_cpp - cmv_extra                 # lucro contábil antes de IR/CSLL
        if estr in ("PRES_COM", "PRES_SERV"):
            pi, pc = (PRES_IRPJ_COM, PRES_CSLL_COM) if estr == "PRES_COM" else (PRES_IRPJ_SERV, PRES_CSLL_SERV)
            irpj = irpj_sobre_base(base_presumida(R, pi))
            csll = CSLL_ALIQ * base_presumida(R, pc)
        elif estr == "REAL":
            lr = max(0.0, LC)                                    # sem adições/exclusões; prejuízo não modelado
            irpj = irpj_sobre_base(lr)
            csll = CSLL_ALIQ * lr
        else:
            irpj, csll = das_ir, 0.0                             # IRPJ+CSLL contidos no DAS
        caixa = L0 - PL - cpp - das_cpp - irpj - csll            # caixa após tributos da PJ (CMV extra não é caixa)
        lucro_liq = LC - irpj - csll
        D = max(0.0, min(caixa, lucro_liq)) * distrib
        red_cap = max(0.0, min(caixa - D, cmv_extra)) if cmv_extra > 0 else 0.0  # redução de capital (custo das quotas)
        t_pj = (irpj + csll) / LC if LC > 0 else 1.0
        ir_pl = irpf_pro_labore(PL)
        irrf = irrf_dividendos(D)
        dv = irpfm(PL, ir_pl, [(D, t_pj)] if D > 0 else [])
        aporte = min(0.0, caixa)                                 # prejuízo de caixa coberto pelo sócio
        liquido = PL - inss_s - ir_pl + D + red_cap - dv["irpfm"] - ganho_capital + aporte
        T_renda = irpj + csll + ir_pl + dv["irpfm"] + ganho_capital
        T_prev = cpp + das_cpp + inss_s
        r.update(PL=PL, cpp=cpp + das_cpp, inss=inss_s, LC=LC, irpj=irpj, csll=csll, caixa=caixa, D=D,
                 red_capital=red_cap, t_pj=t_pj, irpf=ir_pl, irrf=irrf, aliq_irpfm=dv["aliq"],
                 irpfm_pre=dv["pre"], t_pf=dv["t_pf"], redutor=dv["redutor_ef"], irpfm=dv["irpfm"],
                 saldo=dv["irpfm"] - irrf, liquido=liquido, rend_irpfm=dv["rend"], gc=ganho_capital)
    T_sup = cons_abs + T_renda + T_prev                          # carga suportada (exclui IBS/CBS repassado)
    r.update(T_renda=T_renda, T_prev=T_prev, T_sup=T_sup,
             carga_R=T_sup / R, carga_P=T_sup / preco, carga_tot_P=(T_sup + deb) / preco,
             carga_lucro=(T_renda + T_prev) / L0 if L0 > 0 else float("nan"))
    # identidade contábil: líquido = R − C − T_sup (+ redução de capital já incluída no líquido) quando distrib=1
    if distrib == 1.0 and estr != "PF":
        assert abs(r["liquido"] - (R - C - T_sup)) < 0.01, (estr, m, r["liquido"], R - C - T_sup)
    return r


def bissecao(f, a, b, tol=1e-6):
    fa, fb = f(a), f(b)
    if fa * fb > 0:
        return None
    for _ in range(200):
        c = (a + b) / 2
        fc = f(c)
        if abs(fc) < tol or (b - a) < tol:
            return c
        if fa * fc <= 0:
            b, fb = c, fc
        else:
            a, fa = c, fc
    return (a + b) / 2


# ---- Importação de lote (cenário 9) ------------------------------------------------------------------------------
def importacao(ano, va=VA_LOTE, ii=II_NMF, cbs_ref=CBS_REF_2027, icms_com_ibscbs=True):
    ii_v = ii * va
    if ano == 2026:
        pc = PIS_COFINS_IMP * va
        icms = ICMS_IMP_SP / (1 - ICMS_IMP_SP) * (va + ii_v + pc)
        return dict(ii=ii_v, pis_cofins=pc, cbs=0.0, ibs=0.0, icms=icms, total=ii_v + pc + icms)
    base = va + ii_v                                  # LC 214 art. 69 (sem IPI/ICMS; taxas não incluídas)
    cbs = (cbs_ref - REDUCAO_CBS_2027_28) * base
    ibs = IBS_2027_28 * base
    icms_base = base + (cbs + ibs if icms_com_ibscbs else 0.0)
    icms = ICMS_IMP_SP / (1 - ICMS_IMP_SP) * icms_base
    return dict(ii=ii_v, pis_cofins=0.0, cbs=cbs, ibs=ibs, icms=icms, total=ii_v + cbs + ibs + icms)


def fluxo_importacao(ano_imp, credito_estoque_ok=True, cbs_debitos_suficientes=True, icms_com_ibscbs=True):
    """Fluxo mensal (mês 0 = dez/2026). Importação 2026 em dez/2026; 2027 em jan/2027 (mês 1).
    Recuperações: ICMS e CBS/IBS-importação no mês seguinte; crédito de estoque apropriado em jan/2027 e usado
    em 12 parcelas de fev/2027 a jan/2028 (LC 214 art. 381 § 4º)."""
    imp = importacao(ano_imp, icms_com_ibscbs=icms_com_ibscbs)
    fl = [0.0] * 15
    if ano_imp == 2026:
        fl[0] -= imp["total"]
        fl[1] += imp["icms"]
        if credito_estoque_ok and cbs_debitos_suficientes:
            for k in range(2, 14):
                fl[k] += imp["pis_cofins"] / 12
    else:
        fl[1] -= imp["total"]
        fl[2] += imp["icms"] + imp["cbs"] + imp["ibs"]
    saldo, acum, custo_fin = 0.0, [], 0.0
    for v in fl:
        saldo += v
        acum.append(saldo)
        custo_fin += -min(0.0, saldo) * TAXA_FIN_MENSAL
    return imp, fl, acum, -saldo, custo_fin


# ---- Empresa francesa (cenário 11), por € 100 ----------------------------------------------------------------------
def franca():
    L = 100.0
    is_fr = FR_IS * L
    div = L - is_fr
    ret_pf = min(FR_RET_DIV_PF_NR, TRATADO_TETO_DIV) * div
    out = []
    # (i) PF, disponibilização (art. 6º)
    br = BR_IRPF_14754 * div
    br_liq = max(0.0, br - min(ret_pf, br))
    base_i = is_fr + ret_pf + br_liq
    # IRPFM 10% sobre o dividendo (renda total ≥ R$ 1,2 mi), deduzido o "IRPF apurado" da Lei 14.754 (§ 3º, III)
    irpfm_apos = max(0.0, IRPFM_ALIQ_MAX * div - br_liq)      # se "apurado" = após o crédito estrangeiro
    irpfm_antes = max(0.0, IRPFM_ALIQ_MAX * div - br)         # se "apurado" = antes do crédito
    out.append(("PF detém a francesa — disponibilização (Lei 14.754 art. 6º)", is_fr, ret_pf, br_liq,
                base_i, irpfm_apos, irpfm_antes))
    # (ii) PF, regime anual (art. 6º-A): 15% sobre o lucro do balanço (≈ 75), crédito do IS (§ 15)
    br2 = BR_IRPF_14754 * div
    br2_liq = max(0.0, br2 - min(is_fr, br2))
    base_ii = is_fr + br2_liq + ret_pf          # retenção na distribuição posterior sem compensação no Brasil
    out.append(("PF detém a francesa — regime anual (art. 6º-A)", is_fr, ret_pf, br2_liq, base_ii,
                max(0.0, IRPFM_ALIQ_MAX * div - br2_liq), max(0.0, IRPFM_ALIQ_MAX * div - br2)))
    # (iii) PJ brasileira (lucro real) detém a francesa: 34% s/ 100 − crédito (IS + retenção 15% à PJ), excesso perdido
    ret_pj = FR_RET_DIV_PJ_NR * div
    br_pj = max(0.0, NOMINAL_IRPJ_CSLL * L - (is_fr + ret_pj))
    dist = L - is_fr - ret_pj - br_pj
    irpfm_pj = IRPFM_ALIQ_MAX * dist             # t_PJ (IRPJ/CSLL brasileiros / lucro) ≈ 0 -> sem redutor
    out.append(("PJ brasileira (lucro real) detém a francesa; distribui ao sócio", is_fr, ret_pj, br_pj,
                is_fr + ret_pj + br_pj, irpfm_pj, irpfm_pj))
    return out


# =============================================================================
# 3. FORMATAÇÃO
# =============================================================================

def brl(x):
    if x != x:
        return "n/a"
    s = f"{abs(x):,.0f}".replace(",", ".")
    return ("−" if x < -0.5 else "") + s


def pct(x, nd=2):
    if x != x:
        return "n/a"
    return f"{100 * x:.{nd}f}%".replace(".", ",")


def tabela(cab, linhas):
    out = ["| " + " | ".join(cab) + " |", "|" + "|".join(["---"] + ["---:"] * (len(cab) - 1)) + "|"]
    for l in linhas:
        out.append("| " + " | ".join(str(c) for c in l) + " |")
    return "\n".join(out)


NOMES = {
    "PF": "1. PF residente (ICMS SP 18%)",
    "PF_ISENTO": "1'. PF em UF com isenção do autor (ICMS 0%)",
    "PRES_COM": "2. PJ presumido comercial (8%/12%)",
    "PRES_SERV5": "3. PJ presumido serviços, ISS 5%",
    "PRES_SERV2": "3'. PJ presumido serviços, ISS 2%",
    "REAL": "4. PJ lucro real",
    "SIMPLES_I": "5. Simples Anexo I — VEDADO (ilustr.)",
    "SIMPLES_III": "5'. Simples Anexo III — VEDADO (ilustr.)",
}


def rodar_cenario(chave, m, **kw):
    if chave == "PF":
        return simular("PF", m, **kw)
    if chave == "PF_ISENTO":
        return simular("PF", m, aliq_local=ICMS_UF_ISENCAO, **kw)
    if chave == "PRES_SERV5":
        return simular("PRES_SERV", m, aliq_local=ISS_CONSERV, **kw)
    if chave == "PRES_SERV2":
        return simular("PRES_SERV", m, aliq_local=ISS_MINIMO, **kw)
    return simular(chave, m, **kw)


CAB6 = ["Cenário", "(1) R", "(2) Pago pelo comprador", "(3) Lucro contábil¹", "(4) Caixa disponível²",
        "(5) Líquido ao artista/sócio", "(6a) Carga s/ R", "(6b) Carga s/ preço", "(6c) Carga c/ IBS-CBS s/ preço",
        "(6d) Carga s/ lucro L0"]


def linha6(nome, r):
    return [nome, brl(r["R"]), brl(r["preco"]), brl(r["LC"]), brl(r["caixa"]), brl(r["liquido"]),
            pct(r["carga_R"]), pct(r["carga_P"]), pct(r["carga_tot_P"]), pct(r["carga_lucro"])]


# =============================================================================
# 4. VERIFICAÇÕES CONTRA AS NOTAS
# =============================================================================

def verificacoes():
    res = []

    def chk(desc, calc, esperado, tol=0.6):
        ok = abs(calc - esperado) <= tol
        res.append((desc, calc, esperado, "OK" if ok else "DIVERGE"))

    # (a) presumido trimestral R$ 1 mi (nota PJ §3) — sem ICMS, como na nota
    for nome, pi, pc, exp_tot in (("comércio", .08, .12, 61_300), ("serviços", .32, .32, 139_300)):
        irpj = irpj_sobre_base(4 * pi * 1_000_000) / 4
        csll = CSLL_ALIQ * pc * 1_000_000
        chk(f"Presumido {nome}, trimestre R$ 1 mi: IRPJ+CSLL+PIS/Cofins", irpj + csll + PIS_COFINS_CUM * 1e6, exp_tot)
    tot = irpj_sobre_base(4 * .08 * 1e6) / 4 + CSLL_ALIQ * .12 * 1e6 + PIS_COFINS_CUM * 1e6
    chk("Carga efetiva presumido comercial (6,13%) ×10.000", 10_000 * tot / 1e6, 613.0, 0.01)
    irpj_m = irpj_sobre_base(4 * (.08 * 5e5 + .32 * 5e5)) / 4
    chk("Presumido misto 50/50, trimestre", irpj_m + CSLL_ALIQ * (.12 * 5e5 + .32 * 5e5) + PIS_COFINS_CUM * 1e6, 100_300)
    chk("Comércio 100% exportado: carga ×10.000 (2,48%)", 10_000 * (irpj_sobre_base(4 * .08e6) / 4 + CSLL_ALIQ * .12e6) / 1e6, 248.0, 0.01)
    # (b) tabela A4 da nota de parâmetros (sem pró-labore; L = m × R; D = L − IRPJ − CSLL)
    a4 = {("real", .3): (816_000, 81_600, 13_056, 16_320, -65_280), ("serv", .3): (788_800, 78_880, 26_924, 0, -78_880),
          ("com", .3): (1_100_800, 110_080, 0, 91_880, -18_200), ("real", .6): (1_608_000, 160_800, 144_720, 16_080, -144_720),
          ("serv", .6): (1_988_800, 198_880, 0, 198_880, 0), ("com", .6): (2_300_800, 230_080, 0, 230_080, 0),
          ("real", .9): (2_400_000, 240_000, 224_000, 16_000, -224_000), ("serv", .9): (3_188_800, 318_880, 0, 318_880, 0),
          ("com", .9): (3_500_800, 350_080, 0, 350_080, 0)}
    for (reg, m), (d_e, irrf_e, red_e, irpfm_e, saldo_e) in a4.items():
        L = m * RECEITA_REF
        if reg == "real":
            ij, cs = irpj_sobre_base(L), CSLL_ALIQ * L
        elif reg == "serv":
            ij, cs = irpj_sobre_base(.32 * RECEITA_REF), CSLL_ALIQ * .32 * RECEITA_REF
        else:
            ij, cs = irpj_sobre_base(.08 * RECEITA_REF), CSLL_ALIQ * .12 * RECEITA_REF
        D = L - ij - cs
        dv = irpfm(0.0, 0.0, [(D, (ij + cs) / L)])
        irrf = irrf_dividendos(D)
        chk(f"Nota A4 {reg} {int(m*100)}%: D", D, d_e, 1)
        chk(f"Nota A4 {reg} {int(m*100)}%: redutor", dv["redutor"], red_e, 1)
        chk(f"Nota A4 {reg} {int(m*100)}%: IRPFM final", dv["irpfm"], irpfm_e, 1)
        chk(f"Nota A4 {reg} {int(m*100)}%: saldo DAA", dv["irpfm"] - irrf, saldo_e, 1)
    # (c) exemplo com pró-labore no teto (lucro real, 60%)
    PL = 12 * TETO_INSS_MENSAL
    L = 2_400_000 - PL - CPP * PL
    ij, cs = irpj_sobre_base(L), CSLL_ALIQ * L
    D = L - ij - cs
    ir_pl = irpf_pro_labore(PL)
    dv = irpfm(PL, ir_pl, [(D, (ij + cs) / L)])
    chk("Ex. pró-labore: IRPF devido DAA s/ pró-labore", ir_pl, 12_213.65, 0.02)
    chk("Ex. pró-labore: IRRF mensal s/ pró-labore", imposto_tabela(TETO_INSS_MENSAL * (1 - INSS_SOCIO), TABELA_IRPF_MENSAL), 1_165.66, 0.02)
    chk("Ex. pró-labore (real 60%): lucro L", L, 2_277_952.08, 0.02)
    chk("Ex. pró-labore: IRPJ", ij, 545_488.02, 0.02)
    chk("Ex. pró-labore: CSLL", cs, 205_015.69, 0.02)
    chk("Ex. pró-labore: dividendos D", D, 1_527_448.37, 0.02)
    chk("Ex. pró-labore: redutor", dv["redutor"], 134_608.98, 0.05)
    chk("Ex. pró-labore: IRPFM", dv["irpfm"], 16_092.86, 0.05)
    chk("Ex. pró-labore: restituição (IRRF − IRPFM)", irrf_dividendos(D) - dv["irpfm"], 136_651.98, 0.05)
    # (d) Simples Anexo III 2027, margem 30% (nota A4)
    p = SIMPLES["III"]
    das = RECEITA_REF * p["nom"] - p["pd"]
    irp = das * (p["irpj"] + p["csll"])
    L = .3 * RECEITA_REF
    D = L - irp
    dv = irpfm(0.0, 0.0, [(D, irp / L)])
    chk("Simples III 30%: IRPJ+CSLL no DAS", irp, 334_868, 1)
    chk("Simples III 30%: IRPFM", dv["irpfm"], 38_229, 1)
    chk("Simples III 30%: restituição", irrf_dividendos(D) - dv["irpfm"], 48_284, 1)
    chk("Simples I 2027: alíquota efetiva ×10.000 (9,45%)", 10_000 * (RECEITA_REF * .189 - 378_000) / RECEITA_REF, 945, 0.01)
    # (e) IRPF — exemplo da redução (RT 70.000)
    chk("IRPF exemplo RT 70.000 (simplificado)", irpf_anual(70_000 - min(.2 * 70_000, DESC_SIMPL_LIM), 70_000), 2_755.86, 0.02)
    # (f) importação (nota de importação §10)
    chk("Importação 2026 (VA 1 mi): total", importacao(2026)["total"], 406_707.32, 0.5)
    chk("Importação 2026: ICMS", importacao(2026)["icms"], 253_207.32, 0.5)
    chk("Importação 2026, II 3,2%: total", importacao(2026, ii=0.032)["total"], 401_829, 1)
    chk("Importação 2027 (IBS/CBS na base do ICMS): total", importacao(2027)["total"], 406_180, 1)
    chk("Importação 2027 (sem IBS/CBS na base do ICMS): total", importacao(2027, icms_com_ibscbs=False)["total"], 380_483, 1)
    chk("Importação 2027, II 2,4%: total", importacao(2027, ii=0.024)["total"], 389_893, 1)
    chk("Importação 2027, CBS 9,0% (ref. 9,1%): total", importacao(2027, cbs_ref=0.091)["total"], 378_385, 1)
    chk("Importação 2027, CBS 12,5% (ref. 12,6%): total", importacao(2027, cbs_ref=0.126)["total"], 422_605, 1)
    # (g) França por € 100
    fr = franca()
    chk("França disponibilização: carga (36,25)", fr[0][4], 36.25, 0.001)
    chk("França regime anual: carga (34,6)", fr[1][4], 34.6, 0.001)
    # (h) CBS 2027: exemplo da nota (V = 1 mi; ref. 11,3%): CBS 112.000; IBS 1.000; reduzida CBS 44.800, IBS 400
    chk("CBS 2027 sobre V = 1 mi", (CBS_REF_2027 - REDUCAO_CBS_2027_28) * 1e6, 112_000, 0.01)
    chk("CBS 2027 reduzida 60% sobre V = 1 mi", (1 - REDUCAO_ART139) * (CBS_REF_2027 - REDUCAO_CBS_2027_28) * 1e6, 44_800, 0.01)
    # (i) integralização (nota integralização §6): IRPJ+CSLL presumido 4 mi; GC 15% × 3,95 mi
    chk("Integralização ex.: IRPJ+CSLL presumido R$ 4 mi", irpj_sobre_base(.08 * 4e6) + CSLL_ALIQ * .12 * 4e6, 99_200, 0.01)
    chk("Integralização ex.: GC 15% × 3,95 mi", ganho_capital_pf(3_950_000), 592_500, 0.01)
    # (j) fórmula da hipótese B: R = P/(1 + t(1 − a)) contra o solver
    rb = simular("PRES_COM", .6, hip="B")
    chk("Hipótese B: R pelo modelo × fórmula fechada", rb["R"], PRECO_REF_B / (1 + CBS_REF_2027 * (1 - ICMS_SP)), 0.01)
    chk("Hipótese B: preço recomposto = 4.000.000", rb["preco"], PRECO_REF_B, 0.01)
    return res


# =============================================================================
# 5. RELATÓRIO
# =============================================================================

def secao(t):
    print("\n" + "#" * 3 + " " + t + "\n")


def relatorio():
    p = print
    # ---------------------------------------------------------------- verificações
    secao("V. Verificações contra as notas")
    v = verificacoes()
    p(tabela(["Verificação", "Modelo", "Nota/esperado", "Resultado"],
             [(d, f"{c:,.2f}".replace(",", "X").replace(".", ",").replace("X", "."),
               f"{e:,.2f}".replace(",", "X").replace(".", ",").replace("X", "."), s) for d, c, e, s in v]))
    p(f"\nTotal: {sum(1 for x in v if x[3] == 'OK')} OK de {len(v)}.")

    # ---------------------------------------------------------------- cenário-modelo passo a passo
    secao("M. Cenário-modelo: PJ presumido comercial, m = 60%, hipótese A, 2027 (100% vendas internas, SP)")
    r = simular("PRES_COM", 0.60)
    passos = [
        ("R (receita antes de IBS/CBS, com ICMS)", r["R"]),
        ("C = (1 − 0,60) × 4.000.000", r["C"]),
        ("  C_cred = 50% × C", r["C_cred"]),
        ("  C_nc = 50% × C", r["C"] - r["C_cred"]),
        ("ICMS = 18% × R", r["local"]),
        ("Base IBS/CBS = R − ICMS", r["R"] - r["local"]),
        ("CBS = 11,2% × base", (CBS_REF_2027 - REDUCAO_CBS_2027_28) * (r["R"] - r["local"])),
        ("IBS = 0,1% × base", IBS_2027_28 * (r["R"] - r["local"])),
        ("IBS+CBS destacados (débito)", r["deb"]),
        ("Preço pago pelo comprador = R + IBS + CBS", r["preco"]),
        ("Créditos IBS/CBS = 11,3% × C_cred", r["cred"]),
        ("IBS/CBS recolhido líquido = débito − créditos", r["ibscbs_liq"]),
        ("L0 = R − C − ICMS", r["L0"]),
        ("Pró-labore = 12 × 8.475,55", r["PL"]),
        ("CPP 20% s/ pró-labore", r["cpp"]),
        ("Lucro contábil LC = L0 − pró-labore − CPP", r["LC"]),
        ("Base IRPJ = 8% × R", .08 * r["R"]),
        ("IRPJ = 15% × base + 10% × (base − 240.000)", r["irpj"]),
        ("Base CSLL = 12% × R", .12 * r["R"]),
        ("CSLL = 9% × base", r["csll"]),
        ("Caixa disponível = LC − IRPJ − CSLL", r["caixa"]),
        ("Dividendos D (100%, 12 × D/12)", r["D"]),
        ("  D/12 por mês", r["D"] / 12),
        ("IRRF 10% s/ total (D/12 > 50.000) — ano", r["irrf"]),
        ("REND IRPFM = D + pró-labore", r["rend_irpfm"]),
        ("IRPF devido DAA s/ pró-labore (simplificado)", r["irpf"]),
        ("IRPFM antes do redutor = 10% × REND − IRPF devido", r["irpfm_pre"]),
        ("Redutor = D × max(0; t_PJ + t_PF − 34%)", r["redutor"]),
        ("IRPFM final", r["irpfm"]),
        ("Saldo da DAA = IRPFM − IRRF (− = restituição)", r["saldo"]),
        ("INSS do sócio 11%", r["inss"]),
        ("Líquido ao sócio = PL − INSS − IRPF + D − IRPFM", r["liquido"]),
        ("Tributos suportados (ICMS + IRPJ + CSLL + CPP + INSS + IRPF + IRPFM)", r["T_sup"]),
    ]
    p(tabela(["Passo", "R$"], [(a, brl(b)) for a, b in passos]))
    p(f"\nt_PJ = (IRPJ+CSLL)/LC = {pct(r['t_pj'])}; t_PF = {pct(r['t_pf'])}; soma {pct(r['t_pj'] + r['t_pf'])} < 34% → redutor zero.")
    p(f"Carga suportada: {pct(r['carga_R'])} de R; {pct(r['carga_P'])} do preço pago; com IBS/CBS destacado: "
      f"{pct(r['carga_tot_P'])} do preço; sobre o lucro L0 (tributos sobre renda + INSS/CPP): {pct(r['carga_lucro'])}.")

    # ---------------------------------------------------------------- tabelas principais
    chaves = ["PF", "PF_ISENTO", "PRES_COM", "PRES_SERV5", "PRES_SERV2", "REAL", "SIMPLES_I", "SIMPLES_III"]
    for hip in ("A", "B"):
        for m in MARGENS:
            secao(f"T-{hip}-{int(m*100)}. 2027, hipótese {hip}, margem {int(m*100)}% — 100% vendas internas")
            linhas = []
            for k in chaves:
                if k.startswith("SIMPLES") and hip == "B":
                    continue
                linhas.append(linha6(NOMES[k], rodar_cenario(k, m, hip=hip)))
            p(tabela(CAB6, linhas))
    # PF com IRPFM sobre base líquida (leitura alternativa)
    secao("T-PF. PF: IRPFM sobre receita bruta (literal) × sobre rendimento líquido do livro-caixa")
    lin = []
    for hip in ("A", "B"):
        for m in MARGENS:
            for uf, al in (("SP 18%", ICMS_SP), ("isenção 0%", 0.0)):
                a = simular("PF", m, hip=hip, aliq_local=al, pf_irpfm_base="bruta")
                b = simular("PF", m, hip=hip, aliq_local=al, pf_irpfm_base="liquida")
                lin.append([hip, f"{int(m*100)}%", uf, brl(a["irpf"]), brl(a["irpfm"]), brl(a["liquido"]),
                            brl(b["irpfm"]), brl(b["liquido"])])
    p(tabela(["Hip.", "m", "ICMS", "IRPF", "IRPFM (bruta)", "Líquido (bruta)", "IRPFM (líquida)", "Líquido (líquida)"], lin))

    # detalhamento PJ (IRRF, IRPFM, redutor)
    secao("T-DIV. Detalhe de dividendos (2027, hipótese A, vendas internas)")
    lin = []
    for k in ("PRES_COM", "PRES_SERV5", "REAL"):
        for m in MARGENS:
            r = rodar_cenario(k, m)
            lin.append([NOMES[k], f"{int(m*100)}%", brl(r["LC"]), brl(r["irpj"] + r["csll"]), pct(r["t_pj"]), brl(r["D"]),
                        brl(r["D"] / 12), brl(r["irrf"]), pct(r["aliq_irpfm"]), pct(r["t_pf"]), brl(r["redutor"]),
                        brl(r["irpfm"]), brl(r["saldo"])])
    p(tabela(["Cenário", "m", "Lucro contábil", "IRPJ+CSLL", "t_PJ", "D", "D/mês", "IRRF ano", "Alíq. IRPFM", "t_PF",
              "Redutor", "IRPFM final", "Saldo DAA"], lin))

    # ---------------------------------------------------------------- exportação
    secao("X. Exportação (2027, hipótese A): 100% exportado e 50/50")
    lin = []
    for k in ("PF", "PRES_COM", "REAL"):
        for exp in (0.0, 0.5, 1.0):
            for m in MARGENS:
                r = rodar_cenario(k, m, exp=exp)
                lin.append([NOMES[k], f"{int(exp*100)}%", f"{int(m*100)}%", brl(r["preco"]), brl(r["local"]),
                            brl(r["ibscbs_liq"]), brl(r["LC"]), brl(r["liquido"]), pct(r["carga_R"]), pct(r["carga_tot_P"]),
                            pct(r["carga_lucro"])])
    p(tabela(["Cenário", "Export.", "m", "Pago pelo comprador", "ICMS", "IBS/CBS líquido (− = ressarcir)",
              "Lucro contábil¹", "Líquido", "Carga s/ R", "Carga c/ IBS-CBS s/ preço", "Carga s/ L0"], lin))
    p("\nHipótese B na exportação: idêntica à A quando 100% exportado (sem IBS/CBS, preço = R). No 50/50 em B só a metade interna muda:")
    lin = []
    for k in ("PF", "PRES_COM", "REAL"):
        for m in MARGENS:
            r = rodar_cenario(k, m, exp=0.5, hip="B")
            lin.append([NOMES[k], "50% (B)", f"{int(m*100)}%", brl(r["R"]), brl(r["preco"]), brl(r["local"]),
                        brl(r["ibscbs_liq"]), brl(r["LC"]), brl(r["liquido"]), pct(r["carga_R"]), pct(r["carga_tot_P"])])
    p("\n" + tabela(["Cenário", "Export.", "m", "R", "Pago pelo comprador", "ICMS", "IBS/CBS líquido",
                      "Lucro contábil¹", "Líquido", "Carga s/ R", "Carga c/ IBS-CBS s/ preço"], lin))

    # ---------------------------------------------------------------- art. 139
    secao("R139. Redução de 60% (art. 139) — hipótese de Mathias brasileiro nato/naturalizado (2027, vendas internas)")
    lin = []
    for k in ("PF", "PRES_COM"):
        for hip in ("A", "B"):
            for m in MARGENS:
                a = rodar_cenario(k, m, hip=hip)
                b = rodar_cenario(k, m, hip=hip, red139=True)
                lin.append([NOMES[k], hip, f"{int(m*100)}%", brl(a["preco"]), brl(b["preco"]), brl(a["R"]), brl(b["R"]),
                            brl(a["ibscbs_liq"]), brl(b["ibscbs_liq"]), brl(a["liquido"]), brl(b["liquido"]),
                            brl(b["liquido"] - a["liquido"])])
    p(tabela(["Cenário", "Hip.", "m", "Preço (cheia)", "Preço (−60%)", "R (cheia)", "R (−60%)", "IBS/CBS líq. (cheia)",
              "IBS/CBS líq. (−60%)", "Líquido (cheia)", "Líquido (−60%)", "Diferença"], lin))

    # ---------------------------------------------------------------- 2026 x 2027
    secao("Y. 2026 × 2027 (vendas internas; em 2026 o comprador paga R = 4.000.000)")
    lin = []
    for k in ("PF", "PRES_COM", "PRES_SERV5", "REAL"):
        for m in MARGENS:
            r26 = rodar_cenario(k, m, ano=2026)
            ra = rodar_cenario(k, m, hip="A")
            rb = rodar_cenario(k, m, hip="B")
            lin.append([NOMES[k], f"{int(m*100)}%", brl(r26["pis"]), brl(r26["T_sup"]), brl(r26["liquido"]),
                        brl(ra["preco"]), brl(ra["liquido"]), brl(rb["R"]), brl(rb["liquido"]),
                        brl(rb["liquido"] - r26["liquido"])])
    p(tabela(["Cenário", "m", "PIS/Cofins 2026", "Tributos 2026", "Líquido 2026", "Preço 2027-A", "Líquido 2027-A",
              "R 2027-B", "Líquido 2027-B", "Δ 2027-B − 2026"], lin))

    # ---------------------------------------------------------------- pontos de equilíbrio
    secao("E. Pontos de equilíbrio de margem (2027)")
    lin = []

    def be(k1, k2, **kw):
        f = lambda m: rodar_cenario(k1, m, **kw)["liquido"] - rodar_cenario(k2, m, **kw)["liquido"]
        return bissecao(f, 0.05, 0.95)

    for desc, k1, k2, kw in (
            ("Lucro real × presumido comercial (internas, A)", "REAL", "PRES_COM", {}),
            ("Lucro real × presumido comercial (internas, B)", "REAL", "PRES_COM", {"hip": "B"}),
            ("Lucro real × presumido comercial (100% export.)", "REAL", "PRES_COM", {"exp": 1.0}),
            ("Lucro real × presumido serviços ISS 5% (internas, A)", "REAL", "PRES_SERV5", {}),
            ("PF (IRPFM bruta) × presumido comercial (A)", "PF", "PRES_COM", {}),
            ("PF (IRPFM líquida) × presumido comercial (A)", "PF", "PRES_COM", {"pf_irpfm_base": "liquida"}),
            ("PF isenção ICMS (IRPFM líquida) × presumido comercial SP (A)", "PF_ISENTO", "PRES_COM", {"pf_irpfm_base": "liquida"}),
    ):
        mm = be(k1, k2, **kw)
        lin.append([desc, "não se cruzam entre 5% e 95%" if mm is None else pct(mm, 1)])
    p(tabela(["Comparação (líquido ao artista/sócio)", "Margem de equilíbrio"], lin))
    # mapa de vencedor
    lin = []
    for m in (0.20, 0.25, 0.30, 0.35, 0.40, 0.50, 0.60, 0.70, 0.80, 0.90):
        vals = {k: rodar_cenario(k, m)["liquido"] for k in ("PF", "PRES_COM", "REAL")}
        pfl = simular("PF", m, pf_irpfm_base="liquida")["liquido"]
        lin.append([f"{int(m*100)}%", brl(vals["PF"]), brl(pfl), brl(vals["PRES_COM"]), brl(vals["REAL"]),
                    max([("PF (bruta)", vals["PF"]), ("PF (líquida)", pfl), ("Presumido", vals["PRES_COM"]),
                         ("Real", vals["REAL"])], key=lambda x: x[1])[0]])
    p("\n" + tabela(["m", "PF (IRPFM bruta)", "PF (IRPFM líquida)", "PJ presumido com.", "PJ real", "Maior líquido"], lin))

    # ---------------------------------------------------------------- sensibilidades
    secao("S1. Sensibilidade C_cred/C — PJ presumido comercial, m = 60%")
    lin = []
    for fc in SENS_FRAC_C_CRED:
        for desc, kw in (("A, internas", {}), ("B, internas", {"hip": "B"}), ("A, 100% export.", {"exp": 1.0}),
                         ("Simples I (vedado), A", "S")):
            if kw == "S":
                r = simular("SIMPLES_I", .6, frac_cred=fc)
            else:
                r = simular("PRES_COM", .6, frac_cred=fc, **kw)
            lin.append([pct(fc, 0), desc, brl(r["cred"]), brl(r["ibscbs_liq"]), brl(r["perda_cred"]), brl(r["liquido"]),
                        pct(r["carga_tot_P"])])
    p(tabela(["C_cred/C", "Variante", "Créditos IBS/CBS", "IBS/CBS recolhido líq. (− = ressarcir)",
              "Crédito perdido", "Líquido ao sócio", "Carga c/ IBS-CBS s/ preço"], lin))

    secao("S2. Sensibilidade: ICMS sobre base com IBS/CBS (posição SEFAZ-SP) — 2027, m = 60%")
    lin = []
    for k in ("PF", "PRES_COM", "REAL"):
        for hip in ("A", "B"):
            a = rodar_cenario(k, .6, hip=hip)
            b = rodar_cenario(k, .6, hip=hip, icms_base_ibscbs=True)
            lin.append([NOMES[k], hip, brl(a["local"]), brl(b["local"]), brl(a["preco"]), brl(b["preco"]),
                        brl(a["liquido"]), brl(b["liquido"]), brl(b["liquido"] - a["liquido"])])
    p(tabela(["Cenário", "Hip.", "ICMS (base R)", "ICMS (posição SP)", "Preço", "Preço (SP)", "Líquido", "Líquido (SP)", "Δ"], lin))

    secao("S3. Sensibilidade: alíquota de referência da CBS 2027 (hipóteses A e B) — PJ presumido comercial, m = 60%")
    lin = []
    for cr in SENS_CBS_REF:
        for hip in ("A", "B"):
            r = simular("PRES_COM", .6, hip=hip, cbs_ref=cr)
            lin.append([pct(cr, 1), pct(cr - REDUCAO_CBS_2027_28, 1), hip, brl(r["R"]), brl(r["preco"]), brl(r["deb"]),
                        brl(r["liquido"]), pct(r["carga_tot_P"])])
    p(tabela(["Referência", "CBS cobrada", "Hip.", "R", "Preço", "IBS+CBS destacado", "Líquido ao sócio", "Carga c/ IBS-CBS s/ preço"], lin))

    secao("S4. Sensibilidade: ISS 5% × 2% e glosa de livro-caixa (PF) — 2027, A")
    lin = []
    for m in MARGENS:
        a, b = rodar_cenario("PRES_SERV5", m), rodar_cenario("PRES_SERV2", m)
        lin.append(["PJ serviços", f"{int(m*100)}%", "ISS 5% → 2%", brl(a["liquido"]), brl(b["liquido"]), brl(b["liquido"] - a["liquido"])])
    for m in MARGENS:
        a = simular("PF", m, pf_irpfm_base="liquida")
        b = simular("PF", m, pf_irpfm_base="liquida", glosa_lc=0.10)
        lin.append(["PF (IRPFM líquida)", f"{int(m*100)}%", "glosa de 10% de C", brl(a["liquido"]), brl(b["liquido"]), brl(b["liquido"] - a["liquido"])])
    p(tabela(["Cenário", "m", "Variação", "Líquido base", "Líquido variante", "Δ"], lin))

    secao("S5. Distribuição × reinvestimento (PJ presumido comercial, 2027, A)")
    lin = []
    for m in MARGENS:
        for dist in (1.0, 0.5, 0.0):
            r = simular("PRES_COM", m, distrib=dist)
            lin.append([f"{int(m*100)}%", pct(dist, 0), brl(r["D"]), brl(r["irrf"]), brl(r["irpfm"]),
                        brl(r["caixa"] - r["D"]), brl(r["T_sup"])])
    p(tabela(["m", "Distribuído", "Dividendos", "IRRF", "IRPFM", "Retido na PJ", "Tributos no ano"], lin))

    # ---------------------------------------------------------------- estoque / importação
    secao("I. Crédito de estoque × importação 2027 — lote VA R$ 1.000.000 (PJ presumido, SP)")
    i26, i27, i27b = importacao(2026), importacao(2027), importacao(2027, icms_com_ibscbs=False)
    i27m = importacao(2027, ii=II_MERCOSUL_UE_2027)
    p(tabela(["Item", "Dez/2026 (PIS/Cofins-Imp.)", "2027 (IBS/CBS na base do ICMS)", "2027 (ICMS sem IBS/CBS)", "2027, II 2,4% (UE)"],
             [["II", brl(i26["ii"]), brl(i27["ii"]), brl(i27b["ii"]), brl(i27m["ii"])],
              ["PIS/Cofins-Importação", brl(i26["pis_cofins"]), "0", "0", "0"],
              ["CBS-importação", "0", brl(i27["cbs"]), brl(i27b["cbs"]), brl(i27m["cbs"])],
              ["IBS-importação", "0", brl(i27["ibs"]), brl(i27b["ibs"]), brl(i27m["ibs"])],
              ["ICMS-importação SP", brl(i26["icms"]), brl(i27["icms"]), brl(i27b["icms"]), brl(i27m["icms"])],
              ["Desembolso total", brl(i26["total"]), brl(i27["total"]), brl(i27b["total"]), brl(i27m["total"])],
              ["% do VA", pct(i26["total"] / VA_LOTE), pct(i27["total"] / VA_LOTE), pct(i27b["total"] / VA_LOTE), pct(i27m["total"] / VA_LOTE)]]))
    lin = []
    for desc, ano, ok, suf in (("(b) Importa dez/2026; crédito de estoque aceito; há débitos de CBS", 2026, True, True),
                               ("(b') Importa dez/2026; crédito glosado (bem 'novo'? inventário?)", 2026, False, True),
                               ("(b'') Importa dez/2026; PJ 100% exportadora (sem débito de CBS)", 2026, True, False),
                               ("(c) Importa jan/2027 (CBS/IBS creditáveis e ressarcíveis)", 2027, True, True)):
        imp, fl, ac, custo, cf = fluxo_importacao(ano, ok, suf)
        menor = min(ac)
        lin.append([desc, brl(imp["total"]), brl(menor), brl(custo), brl(cf)])
    p("\n" + tabela(["Alternativa", "Desembolso inicial", "Pior posição de caixa acumulada", "Custo final (não recuperado)",
                     "Custo financeiro ilustr. (1% a.m.)"], lin))
    imp, fl, ac, custo, cf = fluxo_importacao(2026)
    imp2, fl2, ac2, custo2, cf2 = fluxo_importacao(2027)
    meses = ["dez/26", "jan/27", "fev/27", "mar/27", "abr/27", "mai/27", "jun/27", "jul/27", "ago/27", "set/27", "out/27",
             "nov/27", "dez/27", "jan/28", "fev/28"]
    p("\n" + tabela(["Mês", "Fluxo — importação 2026", "Acumulado 2026", "Fluxo — importação 2027", "Acumulado 2027"],
                    [[meses[i], brl(fl[i]), brl(ac[i]), brl(fl2[i]), brl(ac2[i])] for i in range(14)]))
    p("\n(a) Sem crédito (obras integralizadas pela PF, ou vindas da PF/empresa estrangeira sem PIS/Cofins): crédito de estoque = 0; "
      "a CBS da venda é integral (sem efeito no lucro na hipótese A).")

    # ---------------------------------------------------------------- integralização
    secao("G. Integralização de lote (VM R$ 2.000.000, custo ≈ 0) vendido em 2027 dentro de R = 4.000.000 (A, internas)")
    gc = ganho_capital_pf(LOTE_INTEGR_VM - LOTE_INTEGR_CUSTO)
    lin = []
    for k in ("PRES_COM", "REAL"):
        for m in MARGENS:
            a = simular(k, m)
            b = simular(k, m, cmv_extra=LOTE_INTEGR_VM, ganho_capital=gc)
            for desc, r in (("(a) aporte pelo custo", a), ("(b) aporte a mercado", b)):
                lin.append([NOMES[k], f"{int(m*100)}%", desc, brl(r["gc"]), brl(r["LC"]), brl(r["irpj"] + r["csll"]),
                            pct(r["t_pj"]) if r["LC"] > 0 else "n/a (LC ≤ 0)", brl(r["D"]), brl(r["red_capital"]),
                            brl(r["irrf"]), pct(r["t_pf"]), brl(r["redutor"]), brl(r["irpfm"]), brl(r["T_renda"]),
                            brl(r["liquido"])])
    p(tabela(["Regime", "m", "Alternativa", "GC na PF", "Lucro contábil", "IRPJ+CSLL", "t_PJ", "Dividendos",
              "Redução de capital", "IRRF", "t_PF", "Redutor", "IRPFM", "Tributos s/ renda (c/ GC)", "Líquido ao sócio"], lin))

    # ---------------------------------------------------------------- França
    secao("F. Empresa francesa mantida — por € 100 de lucro antes do IS (ilustrativo)")
    lin = []
    for nome, is_fr, ret, br, tot, irpfm_apos, irpfm_antes in franca():
        lin.append([nome, f"{is_fr:.2f}", f"{ret:.2f}", f"{br:.2f}", f"{tot:.2f}", f"{irpfm_apos:.2f}", f"{tot + irpfm_apos:.2f}",
                    f"{tot + irpfm_antes:.2f}"])
    p(tabela(["Estrutura", "IS francês", "Retenção FR", "IR Brasil (após crédito)", "Carga sem IRPFM", "IRPFM potencial",
              "Carga c/ IRPFM (IR 14.754 após crédito)", "Carga c/ IRPFM (IR 14.754 antes do crédito)"],
             [[c.replace(".", ",") if i else c for i, c in enumerate(l)] for l in lin]))

    # ---------------------------------------------------------------- 2033
    secao("P. Regime pleno 2033 — ILUSTRATIVO, alíquota ESTIMADA, ICMS/ISS extintos, m = 60%, vendas internas")
    lin = []
    for t in T_2033:
        for k in ("PF", "PRES_COM", "REAL"):
            for hip in ("A", "B"):
                for red in (False, True):
                    r = rodar_cenario(k, .6, ano=2033, t2033=t, hip=hip, red139=red)
                    nome33 = {"PF": "1. PF residente (sem ICMS)", "PRES_COM": NOMES["PRES_COM"], "REAL": NOMES["REAL"]}[k]
                    lin.append([pct(t, 1), nome33, hip, "−60%" if red else "cheia", brl(r["R"]), brl(r["preco"]),
                                brl(r["deb"]), brl(r["liquido"]), pct(r["carga_tot_P"])])
    p(tabela(["CBS+IBS (est.)", "Cenário", "Hip.", "Alíquota", "R", "Preço", "IBS+CBS destacado", "Líquido", "Carga c/ IBS-CBS s/ preço"], lin))

    p("\n¹ Lucro contábil: PJ = R − C − tributos sobre consumo absorvidos − pró-labore − CPP − CMV extra (antes de IRPJ/CSLL). "
      "PF: não há lucro contábil; mostra-se L0 = R − C − ICMS (resultado do livro-caixa antes do INSS).")
    p("² Caixa disponível: PJ = caixa após tributos da PJ e pró-labore, antes da distribuição; PF = caixa após IRPF/INSS/IRPFM.")


if __name__ == "__main__":
    if "--checks" in sys.argv:
        for d, c, e, s in verificacoes():
            print(f"{s:8s} {d}: modelo {c:,.2f} | nota {e:,.2f}")
    else:
        relatorio()
