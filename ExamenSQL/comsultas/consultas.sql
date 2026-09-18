use CENTROSALUD2;
-- =========================================
-- 1.**Número de pacientes atendidos por cada médico**
-- =========================================
SELECT 
    m.id_medico,
    p.nombre,
    p.apellidos,
    COUNT(pa.id_paciente) AS pacientes
FROM medico m
JOIN personal p ON m.id_medico = p.id_personal
LEFT JOIN paciente pa ON m.id_medico = pa.id_medico
GROUP BY m.id_medico, p.nombre, p.apellidos;

-- =========================================
-- 3. **Médicos con mayor cantidad de horas de consulta en la semana**
-- =========================================
SELECT 
    m.id_medico,
    p.nombre,
    p.apellidos,
    SUM(TIME_TO_SEC(h.hora_fin) - TIME_TO_SEC(h.hora_inicio)) / 3600 AS horas
FROM medico m
JOIN personal p ON m.id_medico = p.id_personal
JOIN horario_consulta h ON m.id_medico = h.id_medico
GROUP BY m.id_medico, p.nombre, p.apellidos
ORDER BY horas DESC;

-- =========================================
-- 7.  **Médico con mayor cantidad de pacientes asignados**
-- =========================================
SELECT 
    m.id_medico,
    p.nombre,
    p.apellidos,
    COUNT(pa.id_paciente) AS pacientes
FROM medico m
JOIN personal p ON m.id_medico = p.id_personal
JOIN paciente pa ON m.id_medico = pa.id_medico
GROUP BY m.id_medico, p.nombre, p.apellidos
ORDER BY pacientes DESC
LIMIT 1;

-- =========================================
-- 2. **Total de días de vacaciones planificadas y disfrutadas por cada empleado**
-- =========================================
SELECT 
    p.id_personal,
    p.nombre,
    p.apellidos,
    SUM(v.dias) AS total_dias
FROM personal p
JOIN vacaciones v ON p.id_personal = v.id_personal
WHERE v.estado IN ('planificada', 'disfrutada')
GROUP BY p.id_personal, p.nombre, p.apellidos;

-- =========================================
-- 5.  **Número de médicos que están actualmente en sustitución**
-- =========================================
SELECT COUNT(DISTINCT id_medico_sustituto) AS medicos_en_sustitucion
FROM sustitucion
WHERE CURDATE() >= fecha_inicio
AND (fecha_fin IS NULL OR CURDATE() <= fecha_fin);

