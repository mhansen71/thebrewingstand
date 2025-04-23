#!/bin/bash

# --- Configuration Section ---
# Define URLs in one array and corresponding Filenames in another
# Ensure the order matches! Index 0 of urls corresponds to Index 0 of filenames, etc.

urls=(
    "https://static.wikia.nocookie.net/minecraft_gamepedia/images/5/58/Potion_of_Swiftness_JE3.png/revision/latest?cb=20230303160257"
    "https://static.wikia.nocookie.net/minecraft_gamepedia/images/0/04/Potion_of_Leaping_JE3.png/revision/latest?cb=20230303160250"
    "https://static.wikia.nocookie.net/minecraft_gamepedia/images/f/f0/Potion_of_Strength_JE3.png/revision/latest?cb=20230303163006"
    "https://static.wikia.nocookie.net/minecraft_gamepedia/images/3/3e/Potion_of_Healing_JE2_BE2.png/revision/latest?cb=20191027040649"
    "https://static.wikia.nocookie.net/minecraft_gamepedia/images/d/dc/Potion_of_Poison_JE3.png/revision/latest?cb=20230303160254"
    "https://static.wikia.nocookie.net/minecraft_gamepedia/images/0/06/Potion_of_Regeneration_JE2_BE2.png/revision/latest?cb=20191027040819"
    "https://static.wikia.nocookie.net/minecraft_gamepedia/images/e/ee/Potion_of_Fire_Resistance_JE3.png/revision/latest?cb=20230303160246"
    "https://static.wikia.nocookie.net/minecraft_gamepedia/images/1/1e/Potion_of_Water_Breathing_JE3.png/revision/latest?cb=20230303160259"
    "https://static.wikia.nocookie.net/minecraft_gamepedia/images/5/53/Potion_of_Night_Vision_JE3.png/revision/latest?cb=20230303160253"
    "https://static.wikia.nocookie.net/minecraft_gamepedia/images/b/b7/Potion_of_Slow_Falling_JE2_BE2.png/revision/latest?cb=20191027040830"
    "https://static.wikia.nocookie.net/minecraft_gamepedia/images/8/8b/Potion_of_the_Turtle_Master_JE3.png/revision/latest?cb=20230303170448"
    "https://static.wikia.nocookie.net/minecraft_gamepedia/images/7/73/Potion_of_Weakness_JE2_BE2.png/revision/latest?cb=20191027041010"
    "https://static.wikia.nocookie.net/minecraft_gamepedia/images/7/70/Potion_of_Harming_JE3.png/revision/latest?cb=20230303160247"
    "https://static.wikia.nocookie.net/minecraft_gamepedia/images/c/c2/Potion_of_Slowness_JE3.png/revision/latest?cb=20230303160256"
    "https://static.wikia.nocookie.net/minecraft_gamepedia/images/a/af/Potion_of_Invisibility_JE3.png/revision/latest?cb=20230303160249"
    "https://static.wikia.nocookie.net/minecraft_gamepedia/images/d/d3/Splash_Potion_of_Swiftness_JE3.png/revision/latest?cb=20230303163021"
    "https://static.wikia.nocookie.net/minecraft_gamepedia/images/4/42/Splash_Potion_of_Leaping_JE3.png/revision/latest?cb=20230303163011"
    "https://static.wikia.nocookie.net/minecraft_gamepedia/images/6/65/Splash_Potion_of_Strength_JE3.png/revision/latest?cb=20230303163019"
    "https://static.wikia.nocookie.net/minecraft_gamepedia/images/7/72/Splash_Potion_of_Healing_JE2_BE2.png/revision/latest?cb=20191027041224"
    "https://static.wikia.nocookie.net/minecraft_gamepedia/images/c/c6/Splash_Potion_of_Poison_JE3.png/revision/latest?cb=20230303163016"
    "https://static.wikia.nocookie.net/minecraft_gamepedia/images/e/e5/Splash_Potion_of_Regeneration_JE2_BE2.png/revision/latest?cb=20191027041322"
    "https://static.wikia.nocookie.net/minecraft_gamepedia/images/a/a9/Splash_Potion_of_Fire_Resistance_JE3.png/revision/latest?cb=20230303163007"
    "https://static.wikia.nocookie.net/minecraft_gamepedia/images/b/bd/Splash_Potion_of_Water_Breathing_JE3.png/revision/latest?cb=20230303163022"
    "https://static.wikia.nocookie.net/minecraft_gamepedia/images/6/6f/Splash_Potion_of_Night_Vision_JE3.png/revision/latest?cb=20230303163015"
    "https://static.wikia.nocookie.net/minecraft_gamepedia/images/a/ab/Splash_Potion_of_Weakness_JE2_BE2.png/revision/latest?cb=20191027041455"
    "https://static.wikia.nocookie.net/minecraft_gamepedia/images/b/b4/Splash_Potion_of_Harming_JE3.png/revision/latest?cb=20230303163009"
    "https://static.wikia.nocookie.net/minecraft_gamepedia/images/d/d9/Splash_Potion_of_Slowness_JE3.png/revision/latest?cb=20230303163017"
    "https://static.wikia.nocookie.net/minecraft_gamepedia/images/9/96/Splash_Potion_of_Invisibility_JE3.png/revision/latest?cb=20230303163010"
    "https://static.wikia.nocookie.net/minecraft_gamepedia/images/b/b6/Splash_Potion_of_Slow_Falling_JE2_BE2.png/revision/latest?cb=20191027041332"
    "https://static.wikia.nocookie.net/minecraft_gamepedia/images/f/fa/Splash_Potion_of_the_Turtle_Master_JE3.png/revision/latest?cb=20230303170450"
    "https://static.wikia.nocookie.net/minecraft_gamepedia/images/8/89/Lingering_Potion_of_Swiftness_JE3.png/revision/latest?cb=20230303164102"
    "https://static.wikia.nocookie.net/minecraft_gamepedia/images/9/97/Lingering_Potion_of_Leaping_JE3.png/revision/latest?cb=20230303164053"
    "https://static.wikia.nocookie.net/minecraft_gamepedia/images/8/81/Lingering_Potion_of_Strength_JE3.png/revision/latest?cb=20230303164100"
    "https://static.wikia.nocookie.net/minecraft_gamepedia/images/c/c2/Lingering_Potion_of_Healing_JE2_BE2.png/revision/latest?cb=20200518192752"
    "https://static.wikia.nocookie.net/minecraft_gamepedia/images/e/e3/Lingering_Potion_of_Poison_JE3.png/revision/latest?cb=20230303164057"
    "https://static.wikia.nocookie.net/minecraft_gamepedia/images/9/98/Lingering_Potion_of_Regeneration_JE2_BE2.png/revision/latest?cb=20200518192621"
    "https://static.wikia.nocookie.net/minecraft_gamepedia/images/4/4a/Lingering_Potion_of_Fire_Resistance_JE3.png/revision/latest?cb=20230303164049"
    "https://static.wikia.nocookie.net/minecraft_gamepedia/images/1/11/Lingering_Potion_of_Water_Breathing_JE3.png/revision/latest?cb=20230303164103"
    "https://static.wikia.nocookie.net/minecraft_gamepedia/images/8/8c/Lingering_Potion_of_Night_Vision_JE3.png/revision/latest?cb=20230303164056"
    "https://static.wikia.nocookie.net/minecraft_gamepedia/images/2/20/Lingering_Potion_of_Weakness_JE2_BE2.png/revision/latest?cb=20200518192818"
    "https://static.wikia.nocookie.net/minecraft_gamepedia/images/6/64/Lingering_Potion_of_Harming_JE3.png/revision/latest?cb=20230303164050"
    "https://static.wikia.nocookie.net/minecraft_gamepedia/images/4/41/Lingering_Potion_of_Slowness_JE3.png/revision/latest?cb=20230303164059"
    "https://static.wikia.nocookie.net/minecraft_gamepedia/images/5/55/Lingering_Potion_of_Invisibility_JE3.png/revision/latest?cb=20230303164052"
    "https://static.wikia.nocookie.net/minecraft_gamepedia/images/f/fd/Lingering_Potion_of_Slow_Falling_JE2_BE2.png/revision/latest?cb=20200518192939"
    "https://static.wikia.nocookie.net/minecraft_gamepedia/images/e/ef/Lingering_Potion_of_the_Turtle_Master_JE3.png/revision/latest?cb=20230303170447"
    "https://static.wikia.nocookie.net/minecraft_gamepedia/images/7/75/Water_Bottle_JE2_BE2.png/revision/latest?cb=20191027055423" # Water Bottle
    "https://static.wikia.nocookie.net/minecraft_gamepedia/images/7/75/Water_Bottle_JE2_BE2.png/revision/latest?cb=20191027055423" # Awkward Potion
    # Ingredients
    "https://static.wikia.nocookie.net/minecraft_gamepedia/images/3/3f/Nether_Wart_%28item%29_JE2_BE1.png/revision/latest?cb=20190908024827"
    "https://static.wikia.nocookie.net/minecraft_gamepedia/images/b/b7/Sugar_JE2_BE2.png/revision/latest?cb=20190531031745"
    "https://static.wikia.nocookie.net/minecraft_gamepedia/images/c/c0/Rabbit%27s_Foot_JE3_BE2.png/revision/latest?cb=20190501034244"
    "https://static.wikia.nocookie.net/minecraft_gamepedia/images/7/7c/Blaze_Powder_JE2_BE1.png/revision/latest?cb=20190403182032"
    "https://static.wikia.nocookie.net/minecraft_gamepedia/images/e/e7/Glistering_Melon_Slice_JE3_BE2.png/revision/latest?cb=20190531032839"
    "https://static.wikia.nocookie.net/minecraft_gamepedia/images/1/1a/Spider_Eye_JE2_BE2.png/revision/latest?cb=20190521032215"
    "https://static.wikia.nocookie.net/minecraft_gamepedia/images/c/c5/Ghast_Tear_JE2_BE2.png/revision/latest?cb=20190501043739"
    "https://static.wikia.nocookie.net/minecraft_gamepedia/images/0/08/Magma_Cream_JE3_BE2.png/revision/latest?cb=20190501035730"
    "https://static.wikia.nocookie.net/minecraft_gamepedia/images/0/02/Pufferfish_%28item%29_JE5_BE2.png/revision/latest?cb=20191230044451"
    "https://static.wikia.nocookie.net/minecraft_gamepedia/images/a/aa/Golden_Carrot_JE4_BE2.png/revision/latest?cb=20200430031437"
    "https://static.wikia.nocookie.net/minecraft_gamepedia/images/4/42/Turtle_Shell_%28item%29_JE1_BE1.png/revision/latest?cb=20200511203139"
    "https://static.wikia.nocookie.net/minecraft_gamepedia/images/5/5c/Phantom_Membrane_JE2_BE2.png/revision/latest?cb=20190501045423"
    "https://static.wikia.nocookie.net/minecraft_gamepedia/images/8/85/Fermented_Spider_Eye_JE2_BE2.png/revision/latest?cb=20191026005229"
    "https://static.wikia.nocookie.net/minecraft_gamepedia/images/2/25/Glowstone_Dust_JE2_BE2.png/revision/latest?cb=20190430044519"
    "https://static.wikia.nocookie.net/minecraft_gamepedia/images/e/e1/Redstone_Dust_JE2_BE2.png/revision/latest?cb=20210427032319"
    "https://static.wikia.nocookie.net/minecraft_gamepedia/images/4/40/Gunpowder_JE2_BE2.png/revision/latest?cb=20190816222615"
    "https://static.wikia.nocookie.net/minecraft/images/7/7e/Dragon%27s_Breath_Potion.png/revision/latest?cb=20190929233904"
)

filenames=(
    "potion_swiftness.png"
    "potion_leaping.png"
    "potion_strength.png"
    "potion_healing.png"
    "potion_poison.png"
    "potion_regeneration.png"
    "potion_fire_resistance.png"
    "potion_water_breathing.png"
    "potion_night_vision.png"
    "potion_slow_falling.png"
    "potion_turtle_master.png"
    "potion_weakness.png"
    "potion_harming.png"
    "potion_slowness.png"
    "potion_invisibility.png"
    "splash_potion_swiftness.png"
    "splash_potion_leaping.png"
    "splash_potion_strength.png"
    "splash_potion_healing.png"
    "splash_potion_poison.png"
    "splash_potion_regeneration.png"
    "splash_potion_fire_resistance.png"
    "splash_potion_water_breathing.png"
    "splash_potion_night_vision.png"
    "splash_potion_weakness.png"
    "splash_potion_harming.png"
    "splash_potion_slowness.png"
    "splash_potion_invisibility.png"
    "splash_potion_slow_falling.png"
    "splash_potion_turtle_master.png"
    "lingering_potion_swiftness.png"
    "lingering_potion_leaping.png"
    "lingering_potion_strength.png"
    "lingering_potion_healing.png"
    "lingering_potion_poison.png"
    "lingering_potion_regeneration.png"
    "lingering_potion_fire_resistance.png"
    "lingering_potion_water_breathing.png"
    "lingering_potion_night_vision.png"
    "lingering_potion_weakness.png"
    "lingering_potion_harming.png"
    "lingering_potion_slowness.png"
    "lingering_potion_invisibility.png"
    "lingering_potion_slow_falling.png"
    "lingering_potion_turtle_master.png"
    "potion_water.png" # Water Bottle
    "potion_awkward.png" # Awkward Potion
    # Ingredients
    "nether_wart.png"
    "sugar.png"
    "rabbits_foot.png"
    "blaze_powder.png"
    "glistering_melon_slice.png"
    "spider_eye.png"
    "ghast_tear.png"
    "magma_cream.png"
    "pufferfish.png"
    "golden_carrot.png"
    "turtle_shell.png"
    "phantom_membrane.png"
    "fermented_spider_eye.png"
    "glowstone_dust.png"
    "redstone_dust.png"
    "gunpowder.png"
    "dragons_breath.png"
)

# --- Script Logic ---
output_dir="assets"

# Create the output directory if it doesn't exist
mkdir -p "$output_dir"

# Check if curl is installed
if ! command -v curl &> /dev/null
then
    echo "Error: curl command not found. Please install curl."
    exit 1
fi

echo "Starting image download..."

# Get the number of URLs (should match number of filenames)
num_urls=${#urls[@]}
num_files=${#filenames[@]}

if [ "$num_urls" -ne "$num_files" ]; then
    echo "Error: The number of URLs ($num_urls) does not match the number of filenames ($num_files)."
    exit 1
fi

# Loop through the indices of the arrays
for (( i=0; i<${num_urls}; i++ )); do
    url="${urls[$i]}"
    filename="${filenames[$i]}"
    output_path="$output_dir/$filename"

    # Skip empty URLs or filenames just in case
    if [ -z "$url" ] || [ -z "$filename" ]; then
        echo "Skipping empty entry at index $i"
        continue
    fi

    echo "Downloading '$filename' from $url ..."

    # Use curl to download the image
    # -L: Follow redirects
    # -sS: Silent mode, but show errors
    # -o: Output file path
    # Adding quotes around URL and output path for safety
    curl -L -sS -o "$output_path" "$url"

    # Check if curl command was successful
    if [ $? -eq 0 ]; then
        echo "  SUCCESS: Saved to $output_path"
    else
        echo "  ERROR: Failed to download $filename from $url"
        # Optional: remove partially downloaded file on error
        # rm -f "$output_path"
    fi
done

echo "Image download process finished."

exit 0
```

**Changes Made:**

1.  **Replaced Associative Array:** Removed the `declare -A urls_and_names=(...)` block.
2.  **Added Indexed Arrays:** Created two separate arrays: `urls=(...)` and `filenames=(...)`. **Crucially, the order of items in both arrays must match exactly.** The first URL corresponds to the first filename, the second URL to the second filename, and so on.
3.  **Updated Loop:** Changed the loop to iterate from `0` to the number of items in the `urls` array using a C-style `for` loop (`for (( i=0; i<${num_urls}; i++ ))`). Inside the loop, it accesses the URL and filename using the index `i` (e.g., `url="${urls[$i]}"`).
4.  **Added Count Check:** Included a check to ensure the number of URLs and filenames provided are the same before starting the loop.
5.  **Added Quotes:** Put double quotes around the URL and output path variables in the `curl` command (`-o "$output_path" "$url"`) for better handling of any potential special characters (though less likely to be an issue now).

This indexed array approach is generally more robust in Bash for lists containing complex strings like URLs. Try running this revised `download_images.sh` script (remember to `chmod +x` it again if you saved it as a new file). It should now correctly download the images without the syntax err