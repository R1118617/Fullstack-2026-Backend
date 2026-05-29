four_random_tips_query = """
SELECT tipid, icon, title, description
FROM fitness.fitnesstips
ORDER BY RANDOM()
LIMIT 4;
"""

four_random_coaches_query = """
SELECT coachid, icon, naam, voornaam, specialisatie
FROM fitness.lifestylecoaches
ORDER BY RANDOM()
LIMIT 4;
"""

coach_list_query = """
SELECT coachid, icon, naam, voornaam, specialisatie
FROM fitness.lifestylecoaches
ORDER BY coachid ASC;
"""

insert_afspraak_query = """
INSERT INTO fitness.afspraken (coachid, klantnaam, datum)
VALUES (%s, %s, %s);
"""

get_popup_list = """
    SELECT
        a.afspraakid,
        a.klantnaam,
        a.datum,
        c.voornaam,
        c.naam,
        c.icon
    FROM fitness.afspraken a
    JOIN fitness.lifestylecoaches c
        ON a.coachid = c.coachid
    ORDER BY a.datum ASC;
    """
