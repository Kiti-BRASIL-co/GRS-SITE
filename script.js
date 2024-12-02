async function fetchStats() {
  try {
    const response = await fetch('https://raw.githubusercontent.com/Msdoors/Msdoors.gg/refs/heads/main/Web/Jsons/Json.json');
    const data = await response.json();

    document.getElementById('games').textContent = `Jogos suportados: ${data.games}`;
    document.getElementById('version').textContent = `Versão: ${data.version}`;
  } catch (error) {
    console.error('Failed to fetch JSON data:', error);
  }
}

function copyScript() {
  const script = 'loadstring(game:HttpGet("\/\/\/\/\/\/\/\/\/\"))()';
  navigator.clipboard.writeText(script).then(() => {
    alert('Msdoors foi copiado para sua área de transferência! ');
  });
}

function redirectDiscord() {
  window.location.href = "https://dsc.gg/msdoors-gg";
}

function toggleAchievements() {
  const achievements = document.querySelector('.achievements');
  achievements.classList.toggle('hidden');
}

fetchStats();
