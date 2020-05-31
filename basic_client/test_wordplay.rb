require_relative "wordplay"

# Unit testing class for the WordPlay library
require "minitest/autorun"
class Testwordplay < Minitest::Test

# Test that multiple sentence blocks are split up into individual
# words correctly
   def test_sentences
    assert_equal(["a", "b", "c d", "e f g"], "a. b. c d. e f g.".sentences)

    test_text = %q{Hello. This is a test
    of sentence separation.This is the end of the test.}
      assert_equal("This is the end of the test", test_text.sentences[2])
   end

# Test that sentences of words are split up into distinct words correctly
   def test_words
    assert_equal(%w{This is a test for word seperation}, "This is a test for word seperation".words)
    assert_equal(%w{These are mostly words}, "These, are, mostly, words".words)
   end

# Test that the correct sentence is chosen, given the input
   def test_sentence_choice
    assert_equal("This is a great sentence", Wordplay.best_sentence(["This is a sentence",
    "This is another sentence", "This is a great sentence"], %w{test great this}))
   end

# Test that basic pronouns are switched by switch_pronouns
   def test_switch_pronoun
    assert_equal("i am a robot", Wordplay.switch_pronouns("You are a robot"))
    assert_equal("you are a person", Wordplay.switch_pronouns("i am a person"))
    assert_equal("i love myself", Wordplay.switch_pronouns("you love yourself"))
   end

# Test more complex sentence switches using switch_pronouns
   def test_mixed_pronouns
    assert_equal("you gave me life", Wordplay.switch_pronouns("i gave you life"))
    assert_equal("i am not what you are", Wordplay.switch_pronouns("you are not what i am"))
    assert_equal("i annoy your dog", Wordplay.switch_pronouns("you annoy my dog"))
    end
      
end