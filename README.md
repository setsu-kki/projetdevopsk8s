# projetdevopsk8s

<h1> L'objectif de ce projet est de déployer une application web end to end avec Kubernetes </h1>

<h2> Sujet </h2>
<h3> Niveau 1 : </h3>
<ul> 
  <li> Avoir un conteneur qui fera tourner l'application </li>
  <li> Avoir un conteneur qui fera tourner la base de donnée </li>
</ul>
<h3> Niveau 2 : </h3>
<ul> 
  <li> Avoir un load balanceur </li>
  <li> Avoir deux conteneurs qui feront tourner l'application </li>
  <li> Avoir un conteneur qui fera tourner la base de donnée </li>
</ul>
<p> Dans tous les cas, tout devra être automatisé et le déploiement devra se faire rien qu'en lançant un seul script (y compris le kubernetes managé) </p>

<h2> Outils utilisés </h2>
<ul>
  <li> Kubernetes managé : K3s </li>
  <li> Script automatisé : Bash </li>
  <li> Machine virtuelle : Linux/Debian </li>  
</ul>

<h2> Etapes </h2>
<ol>
  <li> Installer K3s </li>
  <li> Déployer les deux conteneurs qui feront tourner l'application </li>
  <li> Déployer le conteneur qui fera tourner la base données </li>  
  <li> Créer un script qui automatise ces étapes </li>
  <li> Intégrer les étapes dans la pipeline CI/CD GitHub Actions </li>
</ol>
