# Users

User.create!( :email => 'bayart@lookabox.be',          :name => 'François' )
User.create!( :email => 'toussaint@trad.com',          :name => 'Didier'   )
User.create!( :email => 'michael.hoste@gmail.com',     :name => 'Michael'  )
User.create!( :email => 'aurelien.malisart@gmail.com', :name => 'Aurels'   )

# Entries

Entry.create!( :title        => 'Ta mère',
               :content      => "Ta mère est une société montoise qui n'a pas froid aux yeux. C'est pour ça qu'on la met ici.",
               :author_name  => 'François Stephany',
               :author_email => 'tulipe.moutarde@gmail.com',
               :kind         => 'article',
               :url          => 'http://tamere.eu',
               :picture      => File.open(File.join(Rails.root, 'misc', 'seed-pictures', '1.jpg')))

Entry.create!( :title        => 'Ta soeur',
               :content      => "Et ta soeur ? Disent-ils tous ! Et ils ont bien raison !",
               :author_name  => 'Aurélien Malisart',
               :author_email => 'aurelien.malisart@gmail.com',
               :kind         => 'article',
               :url          => 'http://www.tasoeur.biz',
               :picture      => File.open(File.join(Rails.root, 'misc', 'seed-pictures', '2.jpg')))

Entry.create!( :title        => 'Un événement',
               :content      => "Super pechakucha créatif à Mons avec l'aide de CreativeMons et des Rendez-vous des pixelsfestival!",
               :author_name  => 'Romain Carlier',
               :author_email => 'romain.carlier@gmail.com',
               :kind         => 'event',
               :start_date   => "2014-08-02",
               :end_date     => "2014-08-02",
               :url          => 'http://www.pechakucha.org/cities/mons',
               :picture      => File.open(File.join(Rails.root, 'misc', 'seed-pictures', '3.jpg')))

Entry.create!( :title        => 'Ton frère',
               :content      => "Frère Jacques, frère Jacques, dormez-vous ? Dormez-vous ? Sonnez les matines, sonnez les matines, ding dang dong",
               :author_name  => 'Michaël Hoste',
               :author_email => 'michael.hoste@gmail.com',
               :kind         => 'article',
               :url          => 'http://desencyclopedie.wikia.com/wiki/Ton_fr%C3%A8re',
               :picture      => File.open(File.join(Rails.root, 'misc', 'seed-pictures', '4.jpg')))

Entry.create!( :title        => 'Pechakucha',
               :content      => "En japonais ça veut dire un truc comme 'blabla' (d'après Ruben mais personne n'a jamais vérifié)",
               :author_name  => 'Ruben Casad',
               :author_email => 'ruben.casad@gmail.com',
               :kind         => 'article',
               :url          => 'http://www.pechakucha.org/',
               :picture      => File.open(File.join(Rails.root, 'misc', 'seed-pictures', '5.jpg')))

Entry.create!( :title        => 'Barbecues 101',
               :content      => "Organisés par Meaweb, l'invitation aux barbecues est lancée contractuellement maximum 3 heures à l'avance pour bien prendre tout le monde par surprise.",
               :author_name  => 'Simon',
               :author_email => 'simon@gmail.com',
               :kind         => 'event',
               :start_date   => "2014-08-02",
               :end_date     => "2014-08-02",
               :url          => 'https://twitter.com/Meaweb',
               :picture      => File.open(File.join(Rails.root, 'misc', 'seed-pictures', '6.jpg')))

Entry.create!( :title        => 'Cafés numériques',
               :content      => "Beaucoup de bières et parfois une petite conférence sur du numérique. Donc rien à voir avec du café.",
               :author_name  => 'Antoine',
               :author_email => 'antoine@gmail.com',
               :kind         => 'event',
               :start_date   => "2014-08-02",
               :end_date     => "2014-08-02",
               :url          => 'https://twitter.com/Meaweb',
               :picture      => File.open(File.join(Rails.root, 'misc', 'seed-pictures', '7.jpg')))

Entry.create!( :title        => 'Rendez-vous du pixel',
               :content      => "Tous les pixels s'y donnent rendez-vous, et ils sont beaucoup !",
               :author_name  => 'Romain',
               :author_email => 'romain@gmail.com',
               :kind         => 'event',
               :start_date   => "2014-08-02",
               :end_date     => "2014-08-02",
               :url          => 'http://www.pixelsfestival.be/',
               :picture      => File.open(File.join(Rails.root, 'misc', 'seed-pictures', '8.jpg')))

# Comments

Comment.create!( :user_id => 1, :entry_id => 1, :content => "A retravailler niveau orthographe !" )
Comment.create!( :user_id => 2, :entry_id => 1, :content => "Nul !" )
Comment.create!( :user_id => 1, :entry_id => 2, :content => "Sympa :-)" )

# Votes

Entry.all.each do |entry|
  User.all.each do |user|
    Vote.create!(:user => user, :entry => entry, :decision => 'accept')
  end
end
