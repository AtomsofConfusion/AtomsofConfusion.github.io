#!/usr/bin/env ruby

# Run as: build_instrument.rb subject_file.tsv
# or as:  build_instrument.rb subject_id question_order

require 'csv'
require 'mustache'
require '../think_aloud_util.rb'

def write_pdf(subject_id, question_order)
  intro_tex = Mustache.render(File.read("instrument-intro.mustache"), subject_id: subject_id)

  questions = question_order.map{|qid| QUESTION_SNIPPETS.find{|q| q['qid']==qid}}

  questions_tex = questions.map do |q|
    question_source = q['source']
    question_name = q['qid']

    Mustache.render(File.read("instrument-question.mustache"),
      question_source: question_source,
      question_name: question_name)
  end

  survey_tex = File.read("instrument-survey.mustache")

  tex = [intro_tex, questions_tex, survey_tex].flatten.join

  filename = "out/instrument-#{subject_id}.tex"

  File.write(filename, tex)

  `mkdir -p out`
  `pdflatex --output-directory=out/ #{filename}`
end


QUESTION_SNIPPETS = read_question_snippets('../question_snippets.csv')
if ARGV.length == 0
  infile = ARGV.first
  question_orders = read_question_orders('../question_orders.csv')
  question_orders.each do |qorder|
    subject_id, question_order = qorder.values
    STDERR.puts([subject_id, question_order].inspect)
    write_pdf(subject_id, question_order)
  end
elsif ARGV.length == 2
  subject_id, question_order = ARGV
  write_pdf(subject_id, question_order.split(/\D+/).map(&:to_i))
else
  puts "Usage: build_instrument.rb"
  puts "Usage: build_instrument.rb subject_id question_order"
  exit 1
end
