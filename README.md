# Vuelo-basico-2D-en-godot

Sistema de navegación aérea en 2D desarrollado en Godot, enfocado en la respuesta fluida del personaje y la implementación de físicas asimétricas para simular un vuelo natural. El proyecto demuestra la sincronización entre un sistema de estados de animación y un motor de físicas personalizado.

## Funcionamiento
El proyecto cuenta con controles básicos y de uso comun en juegos de el estilo:

Ascender: Flecha Arriba (↑) -- Impulso vertical con animación de aleteo fuerte.
Planeo Lateral: Flecha Izq/Der (← →) -- Movimiento horizontal con inclinación leve.
Descenso: Flecha Abajo (↓) -- Aceleración gravitatoria asistida y cambio de sprite.

### Características Técnicas
Sistema de Vuelo Dinámico: Implementación de físicas donde la fuerza de ascenso (lift) y el descenso por gravedad operan en escalas distintas. Se programó una gravedad incrementada en el descenso para aportar peso y realismo al movimiento.

### Máquina de Estados de Animación:

Aleteo Reactivo: Animación activa vinculada al input de movimiento, con mayor intensidad en desplazamientos verticales.

Modo Picada: Transición automática a una pose aerodinámica al detectar velocidad de caída negativa, mejorando la respuesta visual. Cuenta con un control de velocidad terminal para que el personaje mantenga una respuesta predecible y una inercia controlada, simulando la resistencia natural del aire.

Físicas Diferenciadas: El sistema distingue entre el impulso vertical (aleteo de fuerza) y el desplazamiento lateral, emulando la resistencia del aire.

## Áreas de Oportunidad

Gestión de Límites de Escena: Una limitación técnica identificada es la ausencia de barreras físicas en los bordes de la pantalla. Esto permite que el personaje salga de cámara. Se identificó la necesidad de implementar una lógica de "clamping" en la posición del personaje o una cámara con seguimiento dinámico (Smoothing) para mantener siempre el foco en la acción.
