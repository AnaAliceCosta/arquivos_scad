// Peão baseado estritamente na silhueta geométrica bidimensional 
// Foco no pescoço hiperbólico e no colar robusto com bordas verticais retas

$fn = 150; // Resolução máxima para superfícies limpas

module peao_geometria_oficial() {
    // 1. Base principal (robusta e levemente curada no topo)
    cylinder(h = 2.5, r = 18);
    translate([0, 0, 2.5])
        cylinder(h = 4, r1 = 18, r2 = 14);
        
    // 2. Pescoço Côncavo Acentuado
    // Simula a curva contínua que afunila e depois se expande sutilmente perto do topo
    for (i = [0 : 30]) {
        let (
            h_start = 6.5 + (i * 0.45),
            h_step = 0.45,
            // Curvatura precisa ajustada para bater com a proporção do vetor da logo
            r1_val = 6.0 + 8.0 * pow(1 - (i / 30), 2.2),
            r2_val = 6.0 + 8.0 * pow(1 - ((i + 1) / 30), 2.2)
        )
        translate([0, 0, h_start])
            cylinder(h = h_step, r1 = r1_val, r2 = r2_val);
    }
        
    // 3. O Colar Oficial (Estilo cilíndrico angulado)
    // Transição de subida para o colar
    translate([0, 0, 20.0])
        cylinder(h = 2.0, r1 = 6.0, r2 = 9.8);
    // Borda lateral totalmente vertical e reta (Marca registrada do logo)
    translate([0, 0, 22.0])
        cylinder(h = 2.5, r = 9.8);
    // Corte superior do colar que converge para a cabeça
    translate([0, 0, 24.5])
        cylinder(h = 2.0, r1 = 9.8, r2 = 6.5);
        
    // 4. Cabeça Esférica Centralizada
    translate([0, 0, 32.5])
        sphere(r = 8.5);
}

// Renderiza o peão na escala correta
peao_geometria_oficial();
