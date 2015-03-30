farben = ["#6D7B8D", "#657383", "#616D7E", "#566D7E", "#737CA1", "#2B60DE", "#6960EC", "#736AFF", "#357EC7", "#368BC1", "#488AC7", "#3090C7", "#659EC7", "#87AFC7", "#95B9C7", "#728FCE", "#2B65EC", "#306EFF", "#157DEC", "#1589FF", "#6495ED", "#6698FF", "#38ACEC", "#56A5EC", "#5CB3FF", "#3BB9FF", "#79BAEC", "#82CAFA", "#82CAFF", "#A0CFEC", "#B7CEEC", "#B4CFEC", "#C2DFFF", "#C6DEFF", "#AFDCEC", "#ADDFFF", "#BDEDFF", "#CFECEC", "#E0FFFF", "#EBF4FA", "#F0F8FF", "#F0FFFF", "#CCFFFF", "#93FFE8", "#9AFEFF", "#7FFFD4", "#7DFDFE", "#57FEFF", "#8EEBEC", "#50EBEC", "#4EE2EC", "#81D8D0", "#92C7C7", "#77BFC7", "#78C7C7", "#48CCCD", "#43C6DB", "#46C7C7", "#43BFC7", "#3EA99F", "#3B9C9C", "#438D80", "#348781", "#307D7E", "#5E7D7E", "#4C787E", "#4E8975", "#78866B", "#848b79", "#617C58", "#667C26", "#306754", "#347235", "#437C17", "#387C44", "#347C2C", "#347C17", "#348017", "#4E9258", "#6AA121", "#4AA02C", "#41A317", "#3EA055", "#6CBB3C", "#6CC417", "#4CC417", "#52D017", "#4CC552", "#54C571", "#99C68E", "#89C35C", "#85BB65", "#8BB381", "#9CB071", "#B2C248", "#9DC209", "#A1C935", "#7FE817", "#59E817", "#57E964", "#64E986", "#5EFB6E", "#5FFB17", "#87F717", "#8AFB17", "#6AFB92", "#98FF98", "#B5EAAA", "#C3FDB8", "#CCFB5D", "#B1FB17", "#BCE954", "#EDDA74", "#EDE275", "#FFE87C", "#FFF380", "#FFFFC2", "#FFFFCC", "#FFF8C6", "#FFF8DC", "#F5F5DC", "#FBF6D9", "#FAEBD7", "#F7E7CE", "#FFEBCD", "#F3E5AB", "#ECE5B6", "#FFE5B4", "#FFDB58", "#FFD801", "#FDD017", "#EAC117", "#F2BB66", "#FBB917", "#FBB117", "#FFA62F", "#E9AB17", "#E2A76F", "#DEB887", "#FFCBA4", "#C9BE62", "#E8A317", "#EE9A4D", "#C8B560", "#D4A017", "#C2B280", "#C7A317", "#C68E17", "#B5A642", "#ADA96E", "#C19A6B", "#CD7F32", "#C88141", "#C58917", "#AF9B60", "#AF7817", "#B87333", "#966F33", "#806517", "#827839", "#827B60", "#786D5F", "#835C3B", "#7F5217", "#C47451", "#C36241", "#C35817", "#C85A17", "#E56717", "#E66C2C", "#F87217", "#F87431", "#E67451", "#FF8040", "#F88017", "#FF7F50", "#F88158", "#F9966B", "#E78A61", "#E18B6B", "#E77471", "#F75D59", "#E55451", "#E55B3C", "#F62217", "#F70D1A", "#F62817", "#E42217", "#E41B17", "#DC381F", "#C34A2C", "#C24641", "#C11B17", "#954535", "#8A4117", "#B38481", "#C5908E", "#C48189", "#C48793", "#E8ADAA", "#EDC9AF", "#FDD7E4", "#FCDFFF", "#FFDFDD", "#FBBBB9", "#FAAFBE", "#FAAFBA", "#F9A7B0", "#E7A1B0", "#E799A3", "#E38AAE", "#F778A1", "#E56E94", "#F660AB", "#FC6C85", "#F6358A", "#F52887", "#E45E9D", "#E4287C", "#F535AA", "#E3319D", "#F433FF", "#D16587", "#C25A7C", "#CA226B", "#C12869", "#C12267", "#C25283", "#C12283", "#B93B8F", "#7E587E", "#A74AC7", "#B048B5", "#8D38C9", "#7A5DC7", "#7F38EC", "#8E35EF", "#893BFF", "#8467D7", "#A23BEC", "#B041FF", "#C45AEC", "#9172EC", "#9E7BFF", "#D462FF", "#E238EC", "#C38EC7", "#C8A2C8", "#E6A9EC", "#E0B0FF", "#C6AEC7", "#F9B7FF", "#D2B9D3", "#E9CFEC", "#EBDDE2", "#E3E4FA", "#FDEEF4", "#FFF5EE", "#FEFCFF", "#FFFFFF"]

würfel = (l) -> l[Math.floor(Math.random() * l.length)]


class Kuh

    constructor: (@alter) ->
        # alter ist eine Zahl >=0
        # je älter die Kuh wird, desto höher ist die Wahrscheinlichkeit, dass sie krank wird
        # Lebenserwartung: ca. 20 Jahre
        # wenn die Kuh mindestens 3 Jahre alt ist, gibt sie Milch

        # hunger ist eine Zahl zwischen 0 und 99
        # bei 0 ist die Kuh ganz satt
        # bei 99 ist die Kuh verhungert
        # beim Füttern wird von der Zahl etwas abgezogen (aber es kann kein Wert unter
        # 0 angenommen werden)
        @hunger = 30

        @gemolken = false

        @farbe = würfel farben
        @name = würfel ['Berta', 'Lotta', 'Josefine', 'Henriette', 'Elsa', 'Else', 'Milky', 'Steaky', 'Pia']


    wird_gemolken: ->
        # Gibt zurück, wie viel Milch die Kuh in diesem Jahr gibt (in 100l).
        if @gemolken
            return 0
        @gemolken = true
        geld += if @alter >= 3 then 7 else 0

    wird_gefuettert: ->
        @hunger -= 10
        if @hunger < 0
            @hunger = 0
        geld -= 5

    ist_krank: ->
        Math.random() < 0.1

    ist_gestorben: ->
        if @hunger >= 49
            return "Die Kuh #{ @name } ist verhungert."
        if Math.random() < @alter * 1/25 - 0.1
            return "Die Kuh #{ @name } ist gestorben."


    bekommt_kaelbchen: ->
        @alter >= 3 and Math.random() < 0.2

    bild: ->
        if (@gemolken or @alter < 3) then "kuh1" else "kuh2"


    tick: ->
        @hunger += 8
        @alter += 1
        @gemolken = false


geld = 200
modus = "melken"
kuehe = []
kuehe.push new Kuh 5 for i in [1..3]


kuh_kaufen = ->
    if geld >= 50
        kuehe.push new Kuh 5
        geld -= 50


bearbeiten = (m, id) ->
    console.log m, id
    if modus == "melken"
        kuehe[id].wird_gemolken()
    if modus == "fuettern"
        kuehe[id].wird_gefuettert()
    if modus == "kuh_verkaufen"
        kuehe.splice(id, 1)
        geld += 40
    update_infos()

nachricht = (s, margin=5) ->
    $('#nachrichten').prepend "<p style=\"margin-bottom: #{ margin }px;\">#{ s }</p>"

tick = ->
    nachricht "<hr>", 20

    for kuh in kuehe
        do ->
            kuh.tick()
            if kuh.bekommt_kaelbchen()
                kuehe.push new Kuh 0
                nachricht "Die Kuh #{ kuh.name } bekommt ein Kälbchen."
            if kuh.ist_krank()
                geld -= 30
                nachricht "Die Kuh #{ kuh.name } ist krank. Der Tierarzt kommt. Das kostet 30 Münzen."
            n = kuh.ist_gestorben()
            if n
                nachricht n
                kuh.alter = -1
    kuehe = (kuh for kuh in kuehe when kuh.alter >= 0)

    if geld < 0
        alert "Du bist pleite!"

        # buttons deaktivieren
        $('input.aktion').prop "disabled", true

update_infos = ->
    $('.infos').html ""
    $('#infos').append "<div style=\"display: inline-block; padding: 5px; margin: 5px; background-color: lightgreen; width: 150px; border: 1px solid green;\">#{ Math.max(geld, 0) } Münzen</div>"

    ctr = 0
    for kuh in kuehe
        do ->
            $('#infoskuehe').append "<div class=\"kuh\" id=\"kuh#{ ctr }\" style=\"display: inline-block; width: 150px; padding: 5px; margin: 5px;\"><div style=\"padding: 5px; margin: 5px; background-color: #{ kuh.farbe };\"><b>#{ kuh.name }</b><br>#{ kuh.alter } Jahre<br>Hunger: #{ kuh.hunger }</div><img style=\"margin-left: 5px;\" src=\"img/#{ kuh.bild() }.jpg\"></div>"
            ctr += 1

    $('.kuh').click ->
        bearbeiten modus, +$(this).attr('id')[3..]


jQuery ->
    # buttons mit den entsprechenden funktionen verbinden
    $('#fuettern').click ->
        modus = "fuettern"
        $('div').css('cursor', 'grab')
        update_infos()
    $('#melken').click ->
        modus = "melken"
        $('div').css('cursor', 'cell')
        update_infos()
    $('#kuhkaufen').click ->
        kuh_kaufen()
        update_infos()
    $('#kuhverkaufen').click ->
        modus = "kuh_verkaufen"
        $('div').css('cursor', 'e-resize')
        update_infos()
    $('#naechstesjahr').click ->
        tick()
        update_infos()

    $('div').css('cursor', 'cell')

    # Jahr 0
    tick()
    update_infos()

    # buttons aktivieren
    $('input.aktion').prop "disabled", false

