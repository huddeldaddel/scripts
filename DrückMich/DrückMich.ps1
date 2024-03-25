class Schritt {
    [string]$Frage
    [string[]]$Auswahl
}

$frage1 = [Schritt]::new()
$frage1.Frage = "Bist Du Mädchen oder Junge?"
$frage1.Auswahl = 'Mädchen','Junge'

$frage2 = [Schritt]::new()
$frage2.Frage = "Wie alt bist Du?"
$frage2.Auswahl = '1', '10', '6', 'über 20'

$frage3 = [Schritt]::new()
$frage3.Frage = "Was ist Dein Beruf"
$frage3.Auswahl = 'Kindergartenkind', 'Schüler', 'Bäcker', 'Azubi', 'Arzt', 'Tierarzt', 'Reporter', 'Polizist'

$frage4 = [Schritt]::new()
$frage4.Frage = "Bist Du arm oder reich?"
$frage4.Auswahl = 'Du bist pleite! Pech gehabt!', 'Arm: 36 €', 'Arm: 12 €', 'Arm: 22 €', 'Arm: 27 €', 'Reich: 100.000 €', 'Reich: 10.000 €', 'Reich: 1.000 €', 'Reich: 1.000.000 €'

$frage5 = [Schritt]::new()
$frage5.Frage = "Hast Du Kinder?"
$frage5.Auswahl = 'Ja: 8', 'Ja: 16', 'Ja: 2', 'Ja: 3', 'Ja: 1', 'Ja: 27', 'Nein: 0'

$frage6 = [Schritt]::new()
$frage6.Frage = "Wohin geht es in den Urlaub?"
$frage6.Auswahl = 'Spanien', 'Indien', 'Griechenland', 'Antartis', 'Wüste'

$frage7 = [Schritt]::new()
$frage7.Frage = "Wie stirbst Du?"
$frage7.Auswahl = 'Autounfall', 'Sturz vom Pferd', 'Meteoriteneinschlag', 'Altersschwäche'

$frage8 = [Schritt]::new()
$frage8.Frage = "Wie hast Du Dich benommen?"
$frage8.Auswahl = 'Gut: Himmel', 'Schlecht: Hölle!'

$fragen = $frage1, $frage2, $frage3, $frage4, $frage5, $frage6, $frage7, $frage8

Write-Host "Drück Mich!"
foreach ($frage in $fragen)
{
    Write-Host $frage.Frage
    Read-Host
    $index = Get-Random -Maximum ($frage.Auswahl.Count)
    Write-Host $frage.Auswahl[$index]
    Write-Host ""
}