namespace :crowdbotics do
  desc "TODO"
  task generate_phrases: :environment do
    (1..10).each do
      Phrase.create
    end
  end

end
