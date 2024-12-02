# Prolog
Aquí tienes un archivo `README.md` que incluye instrucciones detalladas para ejecutar tu proyecto **Stack** tanto en **Linux** como en **Windows**:

```markdown
# Proyecto Haskell con Stack

Este es un proyecto Haskell que utiliza **Stack** como herramienta para gestionar dependencias y compilar el código. A continuación se describen los pasos necesarios para ejecutar este proyecto en sistemas **Linux** y **Windows**.

## Instrucciones para Ejecutar el Proyecto

### 1. **Instalar Stack**

#### En **Linux**:

1. Abre una terminal.
2. Ejecuta el siguiente comando para instalar **Stack**:

   ```bash
   curl -sSL https://get.haskellstack.org/ | sh
   ```

   Esto descargará e instalará **Stack** en tu sistema.

3. Verifica que **Stack** se haya instalado correctamente ejecutando:

   ```bash
   stack --version
   ```

   Esto debería mostrarte la versión instalada de **Stack**.

#### En **Windows**:

1. Descarga el instalador de **Stack** desde el sitio web oficial: [Stack Installation](https://docs.haskellstack.org/en/stable/README/).
2. Ejecuta el instalador y sigue las instrucciones en pantalla.
3. Alternativamente, si tienes **Chocolatey** instalado, puedes ejecutar:

   ```bash
   choco install haskell-stack
   ```

4. Verifica que **Stack** se haya instalado correctamente ejecutando el siguiente comando en la terminal:

   ```bash
   stack --version
   ```

   Esto debería mostrar la versión instalada de **Stack**.

---

### 2. **Clonar el Repositorio**

Una vez que **Stack** esté instalado, necesitas clonar el repositorio del proyecto. Para hacerlo, abre una terminal y ejecuta:

```bash
git clone https://github.com/ZequerVirus/Haskell
```

Esto descargará el código fuente del proyecto a tu máquina local.

---

### 3. **Navegar al Directorio del Proyecto**

Después de clonar el repositorio, navega al directorio del proyecto con el siguiente comando:

```bash
cd mi-proyecto
```

Esto te llevará a la carpeta donde está el código del proyecto.

---

### 4. **Instalar las Dependencias y Compilar el Proyecto**

Para instalar las dependencias y compilar el proyecto, ejecuta el siguiente comando en la terminal (dentro del directorio del proyecto):

```bash
stack build
```

**Stack** descargará todas las dependencias necesarias para el proyecto y lo compilará. Este proceso puede tardar algunos minutos dependiendo de la velocidad de tu conexión a Internet y el rendimiento de tu máquina.

---

### 5. **Ejecutar el Proyecto**

Una vez que el proyecto se haya compilado correctamente, puedes ejecutar el programa con el siguiente comando:

```bash
stack exec nombre-del-proyecto-exe
```

Reemplaza `nombre-del-proyecto-exe` con el nombre de tu ejecutable (generalmente se genera automáticamente y debe estar en la carpeta del proyecto). Este comando ejecutará el proyecto en tu terminal.

---

## Resumen de Comandos

### En **Linux** o **Windows**:

1. **Instalar Stack**:
   - Linux: `curl -sSL https://get.haskellstack.org/ | sh`
   - Windows: Usar el instalador desde el sitio web o `choco install haskell-stack` (si tienes Chocolatey).

2. **Clonar el Repositorio**:
   ```bash
   git clone https://github.com/usuario/mi-proyecto.git
   ```

3. **Navegar al Directorio del Proyecto**:
   ```bash
   cd mi-proyecto
   ```

4. **Instalar Dependencias y Compilar**:
   ```bash
   stack build
   ```

5. **Ejecutar el Proyecto**:
   ```bash
   stack exec nombre-del-proyecto-exe
   ```

---

¡Eso es todo! Ahora deberías poder ejecutar el proyecto en tu máquina, tanto en **Linux** como en **Windows**, siguiendo estos pasos.
```

### Resumen de lo que contiene el archivo `README.md`:
- **Instrucciones para instalar Stack** en **Linux** y **Windows**.
- **Clonar el repositorio** y **navegar al directorio** del proyecto.
- **Instalar dependencias** y **compilar el proyecto** con `stack build`.
- **Ejecutar el proyecto** con `stack exec`.

Este archivo `README.md` está diseñado para ser claro y fácil de seguir para cualquier persona que quiera ejecutar tu proyecto en **Linux** o **Windows**. Solo recuerda reemplazar el enlace de GitHub (`https://github.com/usuario/mi-proyecto.git`) con el enlace real de tu repositorio.