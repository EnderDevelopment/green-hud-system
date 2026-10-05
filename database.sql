CREATE TABLE IF NOT EXISTS player_hud_settings (
    identifier VARCHAR(50) PRIMARY KEY,
    hud_enabled BOOLEAN DEFAULT TRUE,
    hud_position_x FLOAT DEFAULT 0.01,
    hud_position_y FLOAT DEFAULT 0.01,
    hud_color_r INT DEFAULT 0,
    hud_color_g INT DEFAULT 255,
    hud_color_b INT DEFAULT 0,
    hud_color_a INT DEFAULT 200,
    hud_font INT DEFAULT 4,
    hud_scale FLOAT DEFAULT 0.4
);

INSERT INTO player_hud_settings (identifier, hud_enabled, hud_position_x, hud_position_y, hud_color_r, hud_color_g, hud_color_b, hud_color_a, hud_font, hud_scale)
SELECT player.identifier, TRUE, 0.01, 0.01, 0, 255, 0, 200, 4, 0.4
FROM users player
LEFT JOIN player_hud_settings settings ON player.identifier = settings.identifier
WHERE settings.identifier IS NULL;