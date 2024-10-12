import Foundation

let drawingPrompts = [
    "Draw a scene from your happiest childhood memory.",
    "Illustrate a day at the beach with friends.",
    "Create a drawing of your favorite family holiday.",
    "Sketch your first pet and the adventures you had together.",
    "Depict a memorable birthday celebration.",
    "Illustrate a time you learned something unexpected.",
    "Create a drawing of your childhood garden.",
    "Sketch a day spent exploring the outdoors.",
    "Visualize a favorite moment from your childhood.",
    "Draw a scene from a time you felt adventurous.",
    "Illustrate a holiday memory that makes you smile.",
    "Create a drawing of a favorite family activity.",
    "Depict a time you celebrated an achievement.",
    "Imagine a moment that brought your family closer.",
    "Draw a picture of your childhood home.",
    "Sketch a family picnic at the park.",
    "Illustrate a trip to the zoo.",
    "Create a drawing of a winter wonderland.",
    "Depict your favorite dessert from childhood.",
    "Visualize a dream you had as a child.",
    "Sketch a family road trip.",
    "Illustrate your favorite toy growing up.",
    "Create a drawing of a memorable school day.",
    "Depict a backyard adventure with friends.",
    "Visualize a fun day at an amusement park.",
    "Draw a moment that made you laugh.",
    "Sketch your favorite holiday tradition.",
    "Illustrate a favorite book or story from your childhood.",
    "Create a drawing of a family gathering.",
    "Depict a time you tried something new.",
    "Visualize a special gift you received.",
    "Draw a picture of your favorite nature spot.",
    "Sketch a fun day spent playing games.",
    "Illustrate your favorite childhood cartoon character.",
    "Create a drawing of a time you felt proud.",
    "Depict a rainy day spent indoors.",
    "Visualize a day at the pool.",
    "Draw a moment of kindness you experienced.",
    "Sketch a childhood friend you remember fondly.",
    "Illustrate a family tradition during the holidays.",
    "Create a drawing of a time you felt loved.",
    "Depict a fun day spent in the city.",
    "Visualize a day spent camping under the stars.",
    "Draw a picture of your favorite childhood meal.",
    "Sketch a time you got lost and found your way.",
    "Illustrate a magical place you imagined as a child.",
    "Create a drawing of a family recipe being made.",
    "Depict a school project you were proud of.",
    "Visualize a time you played in the snow.",
    "Draw a picture of a childhood hero.",
    "Sketch a moment you spent in nature.",
    "Illustrate a family holiday meal.",
    "Create a drawing of a favorite memory with a grandparent.",
    "Depict a time you learned a valuable lesson.",
    "Visualize a birthday cake you loved.",
    "Draw a picture of your favorite childhood activity.",
    "Sketch a family vacation spot.",
    "Illustrate a favorite family game night.",
    "Create a drawing of a summer camp experience.",
    "Depict a time you helped someone in need.",
    "Visualize a drawing that represents your childhood dreams.",
    "Draw a scene from a family movie night.",
    "Sketch a favorite childhood outfit.",
    "Illustrate a memorable concert or performance you attended.",
    "Create a drawing of a family heirloom.",
    "Depict a moment of surprise or joy.",
    "Visualize a place that made you feel safe.",
    "Draw a picture of your favorite tree or plant.",
    "Sketch a time you spent helping others.",
    "Illustrate your favorite childhood saying or mantra.",
    "Create a drawing of a place you always wanted to visit.",
    "Depict a family member you look up to.",
    "Visualize a favorite playground memory.",
    "Draw a moment of creativity or art you enjoyed.",
    "Sketch a time you felt scared but overcame it.",
    "Illustrate a fun time spent with your cousins.",
    "Create a drawing of a family tradition you cherish.",
    "Depict a time you were brave.",
    "Visualize a family game you invented.",
    "Draw a picture of your favorite school subject.",
    "Sketch a time spent in a library or bookstore.",
    "Illustrate a moment that made you feel accomplished.",
    "Create a drawing of your first day at school.",
    "Depict a place that inspired your imagination.",
    "Visualize a time you felt misunderstood but found support.",
    "Draw a picture of a childhood pet.",
    "Sketch a time you discovered something new.",
    "Illustrate a family story that has been passed down.",
    "Create a drawing of a favorite family holiday outing.",
    "Depict a moment that made you feel connected to nature.",
    "Visualize a time spent volunteering or helping in your community.",
    "Draw a scene from your favorite fairy tale.",
    "Sketch a moment that sparked your creativity.",
    "Illustrate a favorite childhood song or dance.",
    "Create a drawing of your favorite hobby growing up.",
    "Depict a family reunion or gathering.",
    "Visualize a cherished memory with friends.",
    "Draw a picture of your favorite childhood hero.",
    "Sketch a time spent at a fair or festival.",
    "Illustrate a magical moment from your childhood.",
    "Create a drawing of your favorite dessert.",
    "Depict a time you made a new friend.",
    "Visualize a moment of reflection or quiet.",
    "Draw a picture of a family road trip.",
    "Sketch a time you had to say goodbye.",
    "Illustrate a family celebration.",
    "Create a drawing of a special place in your heart.",
    "Depict a moment that changed your perspective.",
    "Visualize a lesson learned from a mistake.",
    "Draw a picture of a treasured possession.",
    "Sketch a favorite family vacation memory.",
    "Illustrate a time you made a difference in someone’s life.",
    "Create a drawing of a beautiful sunset you witnessed.",
    "Depict a moment of laughter with family or friends.",
    "Visualize a dream you had as a child.",
    "Draw a picture of a family tradition.",
    "Sketch a time spent at a farmer's market.",
    "Illustrate a family craft or project.",
    "Create a drawing of a special gift you gave.",
    "Depict a moment of inspiration.",
    "Visualize a fun day at the amusement park.",
    "Draw a picture of a favorite childhood book.",
    "Sketch a time you felt a strong connection to someone.",
    "Illustrate a time you learned something important.",
    "Create a drawing of a family camping trip.",
    "Depict a moment of peace in your childhood.",
    "Visualize a special family recipe.",
    "Draw a picture of your favorite childhood animal.",
    "Sketch a time spent at a lake or river.",
    "Illustrate a moment you overcame a challenge.",
    "Create a drawing of a favorite holiday decoration.",
    "Depict a time you enjoyed nature.",
    "Visualize a special memory with a sibling.",
    "Draw a picture of your favorite outdoor activity.",
    "Sketch a moment of kindness you witnessed.",
    "Illustrate a time you spent with an elder.",
    "Create a drawing of a family pet.",
    "Depict a moment of connection with nature.",
    "Visualize a cherished family memory.",
    "Draw a picture of a fun summer activity.",
    "Sketch a time you felt adventurous.",
    "Illustrate a favorite family holiday.",
    "Create a drawing of a special family ritual.",
    "Depict a moment of learning or discovery.",
    "Visualize a time you spent with a mentor.",
    "Draw a picture of a favorite childhood game.",
    "Sketch a moment that made you feel valued.",
    "Illustrate a special outing with friends.",
    "Create a drawing of your favorite snack.",
    "Depict a time spent in the garden.",
    "Visualize a cherished moment with a loved one.",
    "Draw a picture of a family road trip.",
    "Sketch a time you had a magical experience.",
    "Illustrate a favorite family recipe.",
    "Create a drawing of a moment that felt surreal.",
    "Depict a family story you love.",
    "Visualize a time you felt included.",
    "Draw a picture of your favorite character.",
    "Sketch a time spent with grandparents.",
    "Illustrate a moment of self-discovery.",
    "Create a drawing of your favorite season.",
    "Depict a time you felt fulfilled.",
    "Visualize a cherished childhood memory.",
    "Draw a picture of a fun family outing.",
    "Sketch a moment you found joy in simplicity.",
    "Illustrate a favorite game from your childhood.",
    "Create a drawing of a time you felt inspired.",
    "Depict a family bonding experience.",
    "Visualize a moment of peace.",
    "Draw a picture of your favorite family place.",
    "Sketch a time spent with neighbors.",
    "Illustrate a moment of exploration.",
    "Create a drawing of a moment you cherish.",
    "Depict a time spent in your room creating.",
    "Visualize a family ritual you love.",
    "Draw a picture of your favorite nature spot.",
    "Sketch a moment of realization.",
    "Illustrate a family trip to the mountains.",
    "Create a drawing of a favorite toy.",
    "Depict a moment that sparked your imagination.",
    "Visualize a time you felt brave.",
    "Draw a picture of your favorite ice cream flavor.",
    "Sketch a moment of spontaneity.",
    "Illustrate a favorite game from your childhood.",
    "Create a drawing of a family celebration.",
    "Depict a time you felt grateful.",
    "Visualize a moment of happiness.",
    "Draw a picture of a place you want to visit.",
    "Sketch a moment that brought you joy.",
    "Illustrate a favorite childhood activity.",
    "Create a drawing of a special friend.",
    "Depict a time you felt content.",
    "Visualize a cherished family memory.",
    "Draw a picture of a fun family game.",
    "Sketch a moment of beauty in nature.",
    "Illustrate a family outing.",
    "Create a drawing of a moment that changed your life.",
    "Depict a time you felt understood.",
    "Visualize a cherished object from your childhood.",
    "Draw a picture of a favorite song.",
    "Sketch a moment of joy with family.",
    "Illustrate a special family event.",
    "Create a drawing of a time you felt peaceful.",
    "Depict a moment of laughter.",
    "Visualize a cherished family tradition.",
    "Draw a picture of your dream house.",
    "Sketch a moment of connection with a friend.",
    "Illustrate a time spent in nature.",
    "Create a drawing of a favorite family memory.",
    "Draw a moment that makes you feel nostalgic.",
    "Illustrate a fun day at a family reunion.",
    "Create a drawing of a cozy winter night.",
    "Depict your favorite childhood snack.",
    "Sketch a time you explored a new place.",
    "Visualize a dream you had as a child.",
    "Draw a picture of a summer campfire.",
    "Illustrate a memorable road trip with friends.",
    "Create a drawing of your favorite school event.",
    "Depict a day spent in your favorite park.",
    "Sketch a favorite moment from a family vacation.",
    "Illustrate your childhood imaginary friend.",
    "Create a drawing of a moment that made you feel brave.",
    "Depict a favorite seasonal tradition.",
    "Visualize a magical place you imagined as a child.",
    "Draw a picture of your first day at school.",
    "Sketch a time spent with your grandparents.",
    "Illustrate a moment that changed your perspective.",
    "Create a drawing of a special family heirloom.",
    "Depict a time when you felt proud of an achievement.",
    "Visualize a fun day at the zoo.",
    "Draw a picture of your favorite character from a childhood book.",
    "Sketch a moment of connection with a friend.",
    "Illustrate a family tradition during the holidays.",
    "Create a drawing of a cherished family recipe.",
    "Depict a time you overcame a challenge.",
    "Visualize a moment of happiness.",
    "Draw a picture of your favorite nature spot.",
    "Sketch a time spent exploring the woods.",
    "Illustrate a favorite family board game.",
    "Create a drawing of a day at the beach with friends.",
    "Depict a moment of joy during a holiday celebration.",
    "Visualize a special family trip.",
    "Draw a picture of a beautiful sunset.",
    "Sketch a moment of laughter with friends.",
    "Illustrate a time you felt accepted.",
    "Create a drawing of a memorable family dinner.",
    "Depict a time spent in the garden planting flowers.",
    "Visualize a favorite childhood costume.",
    "Draw a picture of your favorite dessert.",
    "Sketch a moment of quiet reflection.",
    "Illustrate a family activity you enjoyed.",
    "Create a drawing of a special day with a grandparent.",
    "Depict a moment of kindness from a stranger.",
    "Visualize a cherished memory from school.",
    "Draw a picture of a favorite childhood movie.",
    "Sketch a time spent stargazing.",
    "Illustrate a memorable family outing to the museum.",
    "Create a drawing of your first pet.",
    "Depict a moment that made you feel loved.",
    "Visualize a favorite childhood game.",
    "Draw a picture of a special family holiday.",
    "Sketch a time spent volunteering.",
    "Illustrate a favorite memory with your siblings.",
    "Create a drawing of a time spent at the library.",
    "Depict a moment of discovery during a hike.",
    "Visualize a cherished object from your childhood.",
    "Draw a picture of your favorite place in the world.",
    "Sketch a time spent at a fair or carnival.",
    "Illustrate a moment of triumph.",
    "Create a drawing of a fun birthday party.",
    "Depict a time you found a hidden treasure.",
    "Visualize a special family ritual during the new year.",
    "Draw a picture of a moment that felt magical.",
    "Sketch a time you felt free.",
    "Illustrate a favorite childhood memory with a friend.",
    "Create a drawing of a memorable holiday gift.",
    "Depict a moment of peace in nature.",
    "Visualize a cherished childhood lesson.",
    "Draw a picture of a fun day spent playing sports.",
    "Sketch a time spent hiking with friends.",
    "Illustrate a special moment from a family vacation.",
    "Create a drawing of your favorite hobby.",
    "Depict a time you felt creative.",
    "Visualize a moment of celebration.",
    "Draw a picture of your favorite childhood book character.",
    "Sketch a memorable time spent at the beach.",
    "Illustrate a family project you were part of.",
    "Create a drawing of a special moment with a friend.",
    "Depict a time you felt inspired.",
    "Visualize a favorite season and its activities.",
    "Draw a picture of your favorite outdoor adventure.",
    "Sketch a time spent camping with family.",
    "Illustrate a moment that made you feel special.",
    "Create a drawing of a memorable family photo.",
    "Depict a moment of learning something new.",
    "Visualize a cherished family activity.",
    "Draw a picture of your favorite park.",
    "Sketch a time spent playing with pets.",
    "Illustrate a special place in your neighborhood.",
    "Create a drawing of a time you helped someone.",
    "Depict a moment of happiness at a family gathering.",
    "Visualize a cherished childhood experience.",
    "Draw a picture of your favorite song or artist.",
    "Sketch a time spent with friends on a special outing.",
    "Illustrate a moment of kindness from a family member.",
    "Create a drawing of your favorite nature scene.",
    "Depict a time you felt a strong connection to your culture.",
    "Visualize a special family recipe being shared.",
    "Draw a picture of a fun day spent with cousins.",
    "Sketch a memorable childhood trip.",
    "Illustrate a time spent helping others in your community.",
    "Create a drawing of a moment of joy during a holiday.",
    "Depict a moment of creativity and inspiration.",
    "Visualize a cherished family vacation memory.",
    "Draw a picture of your favorite outdoor spot.",
    "Sketch a time spent exploring a new hobby.",
    "Illustrate a special time at a friend's house.",
    "Create a drawing of a memorable experience at school.",
    "Depict a time you felt proud of who you are.",
    "Visualize a moment of reflection on your childhood.",
    "Draw a picture of a fun experience at a concert.",
    "Sketch a time spent enjoying nature with family.",
    "Illustrate a favorite childhood activity.",
    "Create a drawing of a time spent at the lake.",
    "Depict a moment of joy shared with friends.",
    "Visualize a special family event.",
    "Draw a picture of a favorite game you played.",
    "Sketch a time spent celebrating a milestone.",
    "Illustrate a time when you felt accepted by others.",
    "Create a drawing of a cherished childhood memory.",
    "Depict a moment of tranquility in nature.",
    "Visualize a time spent with a mentor.",
    "Draw a picture of your favorite place to relax.",
    "Sketch a time spent playing in the rain.",
    "Illustrate a moment of fun with your siblings.",
    "Create a drawing of a family outing to a fair.",
    "Depict a time spent learning a new skill.",
    "Visualize a special day that made you happy.",
    "Draw a picture of your favorite childhood toy.",
    "Sketch a moment of self-discovery during your youth.",
    "Illustrate a memorable school field trip.",
    "Create a drawing of a time spent at a family gathering.",
    "Depict a moment of kindness shown by a friend.",
    "Visualize a cherished family tradition.",
    "Draw a picture of a time you spent volunteering.",
    "Sketch a moment that made you laugh uncontrollably.",
    "Illustrate a special family recipe that was passed down.",
    "Create a drawing of a favorite memory from a holiday.",
    "Depict a time you felt adventurous and curious.",
    "Visualize a cherished place from your childhood.",
    "Draw a picture of a time spent in a beautiful garden.",
    "Sketch a moment of triumph in a competition.",
    "Illustrate a favorite book from your childhood.",
    "Create a drawing of a family vacation spot.",
    "Depict a time spent helping someone in need.",
    "Visualize a moment of celebration at home.",
    "Draw a picture of a special pet you had.",
    "Sketch a time you felt a strong sense of belonging.",
    "Illustrate a cherished memory from school.",
    "Create a drawing of a moment that inspired you.",
    "Depict a time spent with friends enjoying a fun activity.",
    "Visualize a favorite holiday memory.",
    "Draw a picture of a dream you had as a child.",
    "Sketch a moment of happiness shared with family.",
    "Illustrate a memorable time spent with your cousins.",
    "Create a drawing of a time when you felt carefree.",
    "Depict a moment of kindness from a teacher.",
    "Visualize a cherished memory that makes you smile.",
    "Draw a picture of a time spent at a festival.",
    "Sketch a moment of reflection during a quiet time.",
    "Illustrate a special time spent at a relative's house.",
    "Create a drawing of a moment of fun during a birthday party.",
    "Depict a time spent exploring a new place with friends.",
    "Visualize a moment of beauty in everyday life.",
    "Draw a picture of a favorite childhood event.",
    "Sketch a moment of joy during a holiday celebration.",
    "Illustrate a favorite family story.",
    "Create a drawing of a time spent in the mountains.",
    "Depict a moment that made you feel alive.",
    "Visualize a cherished tradition you still hold dear.",
    "Draw a picture of a special event in your life.",
    "Sketch a moment of creativity during a school project.",
    "Illustrate a memorable time spent with friends at a park.",
    "Create a drawing of a moment that brought you joy.",
    "Depict a time spent relaxing in nature.",
    "Visualize a cherished experience that shaped who you are.",
    "Draw a picture of a moment you felt at peace.",
    "Sketch a time spent creating art with friends.",
    "Illustrate a favorite holiday with your family.",
    "Create a drawing of a moment of laughter.",
    "Depict a time spent enjoying a sunny day.",
    "Visualize a special memory from your childhood home.",
    "Draw a picture of a cherished gift you received.",
    "Sketch a moment of kindness from a neighbor.",
    "Illustrate a favorite childhood outing with family.",
    "Create a drawing of a time spent by a river.",
    "Depict a moment that made you feel connected to others.",
    "Visualize a cherished family memory that always makes you smile."
]
