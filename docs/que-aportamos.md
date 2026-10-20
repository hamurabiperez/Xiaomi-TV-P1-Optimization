# Originalidad, atribuciones y diferencias

## Punto de partida

La inspiración fue la idea general de utilizar asistentes de programación con IA para limpiar y personalizar Android TV. No partimos del código de un proyecto concreto de Claude ni usamos sus resultados como referencia experimental. **Usar IA es parte del método de trabajo, no una mejora de rendimiento por sí misma.**

## Qué existía previamente

| Tecnología o idea | Procedencia |
|---|---|
| Conexión y diagnóstico de paquetes | Android Debug Bridge (ADB), herramientas de Android de Google |
| Lanzador alternativo | [Projectivy Launcher](https://github.com/spocky/miproja1), proyecto independiente |
| Ajustes de aplicaciones, imagen y salvapantallas | Funciones originales de Android TV y Xiaomi |
| README profesional y visual | Inspiración de presentación en [Harness²](https://github.com/google-research/harness2), sin reutilizar código ni imágenes |

## Qué aportó el trabajo en este Xiaomi

| Aportación | Evidencia y límites |
|---|---|
| Diagnóstico y autorizaciones por fases | Inventario previo, pruebas comparables y cambios reversibles |
| Detección de caché excepcional | Se recuperaron 7,093 GiB libres limpiando solo la caché desde Ajustes; no es una ganancia generalizable |
| Comparación controlada del lanzador | +63,54 MiB de RAM disponible con Projectivy abierto; no se demostró una reducción importante de CPU |
| Migración con posibilidad de recuperación | Google Launcher desactivado para usuario 0, sin borrar el APK; PatchWall intacto |
| Validaciones funcionales | Inicio, reinicios, apps, Xbox HDMI3, Chromecast y suspensión/reanudación |
| Documentación de incidencias y renuncias | Error recurrente de recomendaciones/salvapantallas y siete paquetes adicionales conservados por precaución |
| Revisión de imagen y sonido | Modos elegidos y HDR restaurado; sin afirmar calibración profesional |
| Publicación que protege datos | Material nuevo y curado, sin registros personales ni scripts operativos originales |

## Qué no es

No desarrollamos Projectivy, un firmware, un método universal de optimización ni un eliminador automático de paquetes. Tampoco prometemos compatibilidad con otros televisores ni mejoras permanentes de CPU. Es un estudio de caso real, limitado a este modelo y versión.

## Créditos

Pruebas y decisiones del proyecto: [@hamurabiperez](https://github.com/hamurabiperez), con asistencia de IA para análisis, documentación y herramientas. Cada componente de terceros conserva sus autores y licencias. La inspiración visual de Harness² no supone afiliación ni reutilización de su código.
