# FoodChain exercism.io exercise
class FoodChain
  VERSION = 2
  def self.song
    @persons = [
      { person: 'fly',
        remark: '' },
      { person: 'spider',
        remark: 'It wriggled and jiggled and tickled inside her.' },
      { person: 'bird',
        remark: 'How absurd to swallow a bird!' },
      { person: 'cat',
        remark: 'Imagine that, to swallow a cat!' },
      { person: 'dog',
        remark: 'What a hog, to swallow a dog!' },
      { person: 'goat',
        remark: 'Just opened her throat and swallowed a goat!' },
      { person: 'cow',
        remark: "I don't know how she swallowed a cow!" },
      { person: 'horse',
        remark: '' }
    ]

    lyrics = ''

    0.upto(7) do |iteration|
      lyrics +=  "#{generate_part(iteration)}\n"
    end
    lyrics
  end

  def self.generate_part(person_num)
    lyrics = ''
    if person_num == 0
      lyrics = "I know an old lady who swallowed a fly.\n"
    elsif person_num == 7
      lyrics = 'I know an old lady who swallowed a horse.'\
        "\nShe's dead, of course!"
      return lyrics
    else
      lyrics += 'I know an old lady who swallowed a'\
        " #{@persons[person_num][:person]}.\n"
      lyrics += "#{@persons[person_num][:remark]}\n"
      person_num.downto(1) do |num|
        if @persons[num][:person] == 'bird'
          modified_remark = @persons[num - 1][:remark]
          modified_remark.gsub!(/It /, '')
          lyrics += "She swallowed the #{@persons[num][:person]}"\
            " to catch the #{@persons[num - 1][:person]}"\
            " that #{modified_remark}\n"
        else
          lyrics += "She swallowed the #{@persons[num][:person]}"\
            " to catch the #{@persons[num - 1][:person]}.\n"
        end
      end
    end
    lyrics += "I don't know why she swallowed the fly. Perhaps she'll die.\n"
    lyrics
  end
end
