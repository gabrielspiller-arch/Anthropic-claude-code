import re, sys
out = open(sys.argv[1], encoding="utf-8").read()
tpl = open(sys.argv[2], encoding="utf-8").read()
secs = {}
for bloco in re.split(r"\n(?=### )", "\n" + out):
    bloco = bloco.strip("\n")
    if not bloco.startswith("### "):
        continue
    cab, _, corpo = bloco.partition("\n")
    chave = cab[4:].split(" ", 1)[0]
    secs[chave] = "#### " + cab[4:] + "\n" + corpo.rstrip()
# footnotes (last lines after section P)
notas = [l for l in out.splitlines() if l.startswith("¹") or l.startswith("²")]
def sub(m):
    k = m.group(1)
    if k not in secs:
        raise SystemExit("seção ausente: " + k)
    s = secs[k]
    if k == "P.":  # remove notas de rodapé do fim da última seção
        s = "\n".join(l for l in s.splitlines() if not (l.startswith("¹") or l.startswith("²"))).rstrip()
    return s
md = re.sub(r"\{\{SEC:([^}]+)\}\}", sub, tpl)
md = md.replace("{{NOTAS}}", "\n\n".join(notas))
open(sys.argv[3], "w", encoding="utf-8").write(md)
usadas = set(re.findall(r"\{\{SEC:([^}]+)\}\}", tpl))
print("seções no output:", sorted(secs)); print("não usadas:", sorted(set(secs) - usadas))
