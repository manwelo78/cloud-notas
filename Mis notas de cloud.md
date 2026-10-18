# Mis notas de cloud

Repositorio donde voy apuntando lo que aprendo en mi ruta hacia un puesto de cloud (AWS, DevOps). Empiezo desde cero, con una hora al día.

**Plan general:** Linux y terminal → redes y Python → AWS Cloud Practitioner → AWS Solutions Architect Associate → Git, Docker, Terraform y CI/CD → proyectos.

## Estado actual

- [x] Instalar Linux (Ubuntu) en Windows con WSL
- [x] Comandos básicos de terminal
- [x] Permisos
- [x] Primer script Bash
- [x] Buscar y filtrar (`grep`, `find`) y tuberías
- [x] Procesos y paquetes (`ps`, `kill`, `top`, `apt`)
- [x] Scripts con variables, condicionales y bucles
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
| --- | --- |
| `pwd` | Muestra dónde estoy |
| `ls` | Lista el contenido |
| `ls -l` | Lista con detalles (permisos, tamaño, fecha) |
| `ls -R` | Incluye subcarpetas |
| `cd carpeta` | Entra en una carpeta |
| `cd ..` | Sube un nivel |
| `cd ~` | Va a mi carpeta personal |

## 3. Crear, copiar, mover y borrar

| Comando | Qué hace |
| --- | --- |
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

## 8. Procesos y paquetes

```bash
ps                  # procesos de mi terminal
ps aux | head -n 5  # todos los procesos, solo las primeras líneas
sleep 300 &         # lanza una espera de 5 min en segundo plano (& = al fondo)
kill 806            # para el proceso con PID 806 (con espacio y el PID real)
top                 # monitor en vivo; salir con la tecla q
```

Cómo leer la cabecera de `top`:

- `Tasks`: procesos totales, en ejecución y dormidos.
- `%Cpu(s)`: `id` es el porcentaje de CPU libre (idle). 100 id = sin carga.
- `load average`: carga media del sistema; cerca de 0 es un sistema relajado.
- `Mem` y `Swap`: memoria total, libre y usada, en MiB.
- En la tabla, `%CPU` y `%MEM` dicen qué proceso consume más.

Instalar programas con `apt`:

```bash
sudo apt install -y tree
tree ~/cloud        # muestra las carpetas como un árbol
```

## 9. Bash: variables, bucles y condicionales

Archivo [`practica.sh`](practica.sh):

```bash
#!/bin/bash
nombre="Manuel"
echo "Hola, $nombre"

for i in 1 2 3
do
  echo "Vuelta $i"
done

edad=25
if [ $edad -ge 18 ]
then
  echo "Eres mayor de edad"
else
  echo "Eres menor de edad"
fi
```

- `nombre="Manuel"`: guarda un valor. Sin espacios alrededor del `=`. Se usa con `$nombre`.
- `for ... do ... done`: repite una vez por cada valor de la lista.
- `if ... then ... else ... fi`: decide según una condición. Los espacios dentro de `[ ]` son obligatorios.
- Comparaciones numéricas: `-eq` igual, `-lt` menor, `-gt` mayor, `-ge` mayor o igual.

### Copia de seguridad

Archivo [`copia.sh`](copia.sh):

```bash
#!/bin/bash
origen=~/cloud
destino=~/copia_cloud
mkdir -p $destino
cp -r $origen/* $destino/
echo "Copia hecha en $destino"
ls $destino
```

- `mkdir -p` no da error si la carpeta ya existe, así que el script se puede ejecutar varias veces.
- Comprobación: `ls ~/cloud` y `ls ~/copia_cloud` muestran lo mismo.

## 10. Errores que me han salido

| Mensaje | Causa | Solución |
| --- | --- | --- |
| `Error: 87` (DISM) | Comando escrito incompleto | Copiar y pegar |
| `Invalid username` | Nombre con mayúsculas o `@` | Solo minúsculas, números, `_` y `-` |
| `syntax error near unexpected token 'newline'` | Faltaba el archivo tras `>>` | Completar el comando |
| Aparece `>` y no termina | Comillas sin cerrar | `Ctrl + C` y reescribir |
| `No such file or directory` | Nombre mal escrito o carpeta incorrecta | `pwd` y `ls` |
| `Permission denied` | Falta permiso `x` | `chmod +x archivo` |
| `command not found` (`secho`) | Letra de más al editar | Corregir con `nano` |
| `unexpected argument '-1'` | Escribí `-1` en vez de `-l` | La opción es la letra `l` |
| Salió `0` en un `wc -l` | Un comando anterior de la tubería falló (`frutas` sin `.txt`) | Probar cada parte por separado |
| `kill608: command not found` | Faltaba el espacio entre `kill` y el número | `kill 806` |
| `unexpected argument '-a'` en `cat` | Las opciones distinguen mayúsculas (`-A`) | Usar `-A` |
| `Command 'chnod' not found` | Escribí `chnod` en vez de `chmod` | Revisar letra a letra; flecha arriba para corregir |
| `mv: missing destination file operand` | Faltaba el espacio: `practica.sh~/cloud/` | `mv practica.sh ~/cloud/` |
| `mvpractica.sh~/cloud/: No such file` | Sin espacio entre comando y argumento | Separar con espacios |

## 11. Trucos

- **Flecha arriba**: recupera comandos anteriores.
- **Tab**: autocompleta nombres de archivos.
- **Ctrl + C**: cancela lo que esté colgado.
- Si un comando sale bien, normalmente no muestra nada.
- Un `0` no siempre significa "todo bien": mirar si hay un error justo encima.
- Mayúsculas y minúsculas importan, también en las opciones (`-A` no es `-a`).
- Cada parte de un comando va separada por espacios (`kill 806`, no `kill806`).
- En el teclado español, `|` es **AltGr + 1**.

## Próximos pasos

- OverTheWire Bandit (un nivel al día).
- Python básico.