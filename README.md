
# Calculadora Binaria en COBOL

Este proyecto es una **calculadora de operaciones básicas en binario**, desarrollada en **COBOL**, con un **menú interactivo** y una estructura modular clásica. Permite realizar:

- Suma
- Resta
- Multiplicación
- División
- Salida del programa

La calculadora convierte números binarios a decimal, realiza la operación y luego devuelve el resultado nuevamente en binario.

---
## 📁 Estructura del Proyecto

```
calculadora-binaria-cobol/
│
├── src/
│   └── bin-calc.cob        # Código fuente principal en COBOL
│
├── docs/
│   └── README.md           # Documentación del proyecto
│
└── LICENSE                 # (Opcional) Licencia del proyecto
```

---
## ▶️ Ejecución

### **1. Compilar**
Usando GnuCOBOL:
```bash
cobc -x src/bin-calc.cob -o bin-calc
```

### **2. Ejecutar**
```bash
./bin-calc
```

---
## 📌 Requisitos
- **GnuCOBOL** (recomendado)
- Sistema operativo: Linux, FreeBSD, macOS o Windows (con GnuCOBOL instalado)

---
## ✔️ Características
- Menú interactivo
- Conversión **binario → decimal → binario**
- Modularización mediante párrafos y secciones
- Soporte para números binarios de hasta 32 bits
- Manejo de errores para división por cero

---
## 📜 Ejemplo de Uso
```
-------------------------------------
   CALCULADORA BINARIA EN COBOL
-------------------------------------
1) Sumar
2) Restar
3) Multiplicar
4) Dividir
5) Salir
Seleccione una opción: 1

Ingrese el primer número binario:
1010
Ingrese el segundo número binario:
0011
Resultado en binario: 1101
```

---
##  Archivos incluidos
- `bin-calc.cob`: Programa completo con menú y modularización.
- `README.md`: Este archivo.

---
##  Autora
**Antonela Estefania Arenas**


