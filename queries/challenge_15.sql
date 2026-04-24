-- A query that creates or replaces a user-defined SQL function, count_vowels

-- The function should accept a string and return an integer representing the number of vowels in the string

-- Y should be counted as a vowel

-- Vowels are not case-sensitive

CREATE OR REPLACE FUNCTION count_vowels(input_string TEXT)  
RETURNS INTEGER AS $$
DECLARE
    vowel_count INTEGER := 0;
    i INTEGER;
    current_char CHAR;
BEGIN
    FOR i IN 1..LENGTH(input_string) LOOP
        current_char := LOWER(SUBSTRING(input_string, i, 1));
        IF current_char IN ('a', 'e', 'i', 'o', 'u', 'y') THEN
            vowel_count := vowel_count + 1;
        END IF;
    END LOOP;
    RETURN vowel_count;
END;
$$ LANGUAGE plpgsql;