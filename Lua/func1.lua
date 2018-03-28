-- Jedes Skript ist auch eine Funktion

-- funktion welche x quadriert
function square(x)
	return x * x
end

-- Variable y welche die Parameter enthält
local y = { ... }

-- Den ersten Wert aus y holen
-- INDICES IN LUA FANGEN MIT 1 AN!!!
local par1 = y[1]

-- ruft die funktion square auf und gibt das ergebnis zurück
return square(par1)