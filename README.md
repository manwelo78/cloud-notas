# Mis notas de cloud

Repositorio donde voy apuntando lo que aprendo en mi ruta hacia un puesto de cloud (AWS, DevOps). Empiezo desde cero, con una hora al día.

**Plan general:** Linux y terminal → redes y Python → AWS Cloud Practitioner → AWS Solutions Architect Associate → Git, Docker, Terraform y CI/CD → proyectos.

## Estado actual

- [x] Instalar Linux (Ubuntu) en Windows con WSL
- [x] Comandos básicos de terminal
- [x] Permisos
- [x] Primer script Bash
- [x] Buscar y filtrar (`grep`, `find`) y tuberías
- [ ] Procesos y paquetes (`ps`, `kill`, `top`, `apt`)
- [ ] Scripts con variables, condicionales y bucles
- [ ] OverTheWire Bandit
- [ ] Python básico

---

## 1. Instalar Linux en Windows (WSL)

```powershell
wsl --install -d Ubuntu-24.04
```

- Usar siempre PowerShell normal o Windows Terminal (no PowerShell ISE).
- Al crear el usuario: solo minúsculas, números, `_` y `-`.
- Abrir otro día: `Ubuntu` en el menú Inicio, o `wsl` en PowerShell.
- Actualizar el sistema:

```bash
sudo apt update && sudo apt upgrade -y
```

Comandos útiles si algo falla:

```powershell
wsl --status
wsl --list --verbose
wsl --update
```

## 2. Moverse y ver

| Comando | Qué hace |
|---|---|
| `pwd` | Muestra dónde estoy |
| `ls` | Lista el contenido |
| `ls -l` | Lista con detalles (permisos, tamaño, fecha) |
| `ls -R` | Incluye subcarpetas |
| `cd carpeta` | Entra en una carpeta |
| `cd ..` | Sube un nivel |
| `cd ~` | Va a mi carpeta personal |

## 3. Crear, copiar, mover y borrar

| Comando | Qué hace |
|---|---|
| `mkdir nombre` | Crea una carpeta |
| `mkdir -p a/b/c` | Crea carpetas anidadas |
| `touch archivo.txt` | Crea un archivo vacío |
| `cp origen destino` | Copia (el original se queda) |
| `mv origen destino` | Mueve o renombra |
| `rm archivo` | Borra un archivo |
| `rm -r carpeta` | Borra una carpeta entera |

> En Linux no hay papelera. Antes de `rm -r`, comprobar con `pwd` y `ls`.

## 4. Escribir y leer texto

```bash
echo "texto" > archivo.txt     # sobrescribe
echo "otro" >> archivo.txt     # añade al final
cat archivo.txt                # muestra el contenido
cat -A archivo.txt             # muestra caracteres ocultos ($ = fin de línea)
```

## 5. Permisos

`ls -l` muestra algo como `-rw-r--r--`:

- Primera letra: `-` archivo, `d` carpeta.
- Después, tres grupos: propietario, grupo y resto.
- `r` = leer (4), `w` = escribir (2), `x` = ejecutar (1).

```bash
chmod 600 archivo   # -rw-------  solo yo
chmod 644 archivo   # -rw-r--r--  yo escribo, todos leen
chmod +x archivo    # permiso de ejecución
```

## 6. Mi primer script Bash

Archivo [`saludo.sh`](saludo.sh):

```bash
echo "Hola desde un script"
```

```bash
chmod +x saludo.sh
./saludo.sh
```

## 7. Buscar y filtrar

```bash
head -n 2 frutas.txt            # primeras 2 líneas
tail -n 2 frutas.txt            # últimas 2 líneas
grep manzana frutas.txt         # líneas que contienen "manzana"
grep -i NARANJA frutas.txt      # ignora mayúsculas
grep -c manzana frutas.txt      # cuenta coincidencias
find ~/cloud -name "*.txt"      # busca archivos por nombre
```

### Tuberías (`|`)

La salida de un comando pasa como entrada al siguiente:

```bash
ls -l | grep txt
cat frutas.txt | grep manzana | wc -l   # cuenta líneas con "manzana"
```

## 8. Errores que me han salido

| Mensaje | Causa | Solución |
|---|---|---|
| `Error: 87` (DISM) | Comando escrito incompleto | Copiar y pegar |
| `Invalid username` | Nombre con mayúsculas o `@` | Solo minúsculas, números, `_` y `-` |
| `syntax error near unexpected token 'newline'` | Faltaba el archivo tras `>>` | Completar el comando |
| Aparece `>` y no termina | Comillas sin cerrar | `Ctrl + C` y reescribir |
| `No such file or directory` | Nombre mal escrito o carpeta incorrecta | `pwd` y `ls` |
| `Permission denied` | Falta permiso `x` | `chmod +x archivo` |
| `command not found` (`secho`) | Letra de más al editar | Corregir con `nano` |
| `unexpected argument '-1'` | Escribí `-1` en vez de `-l` | La opción es la letra `l` |
| Salió `0` en un `wc -l` | Un comando anterior de la tubería falló | Probar cada parte por separado |

## 9. Trucos

- **Flecha arriba**: recupera comandos anteriores.
- **Tab**: autocompleta nombres de archivos.
- **Ctrl + C**: cancela lo que esté colgado.
- Si un comando sale bien, normalmente no muestra nada.
- Mayúsculas y minúsculas importan, también en las opciones (`-A` no es `-a`).
- En el teclado español, `|` es **AltGr + 1**.

## Próximos pasos

- Procesos: `ps`, `sleep`, `kill`, `top`.
- Paquetes: `sudo apt install`.
- Scripts Bash con variables, condicionales y bucles.
- OverTheWire Bandit (un nivel al día).
- Python básico.
