require './think_aloud_util.rb'

class Hash; def map_values
  Hash[map { |k, v| [k, yield(v)] }]
end; end

question_snippets = read_question_snippets()

$question_types = question_snippets.group_by{|q| q['type']}
$question_types.map_values{|a| a.size}

def select_questions(n)
  # how many of each type of question to show each subject
  n_cs   = 5
  n_ncs  = 1
  n_hcs  = 1
  n_hncs = 1

  qcs = $question_types['C']

  puts "qcs #{qcs.size}"
  puts "n_cs #{n_cs}"

  # make sure confusing questions are each represented the same number of times,
  # and that each question cooccurres with each other question
  cs = (1..(n*qcs.size.to_f/n_cs).ceil).map{|i| auto_zip(qcs, i)}.flatten.each_slice(n_cs).take(n)

  cycled_qs = $question_types.map_values(&:cycle)
  ncs  = cycled_qs['NC' ].each_slice(n_ncs ).take(n)
  hcs  = cycled_qs['HC' ].each_slice(n_hcs ).take(n)
  hncs = cycled_qs['HNC'].each_slice(n_hncs).take(n) # assumes this array is in same order as hcs

  ncs.zip(cs, hcs, hncs).map{|qs| qs.reduce([], :concat).shuffle}
end

def cooccurrences(aa)
  aa.inject(Hash.new{0}) do |h,a|
    a.combination(2).map do |(e1, e2)|
      h[[e1, e2].sort] += 1
    end
    h
  end
end

def auto_zip(a, offset)
  slices = a.each_slice(offset%(a.size-1)+1)
  slices.first.zip(*slices.drop(1)).flatten.compact
end

def random_id
  (0..3).map{|x| rand(10)}.join('')
end

def make_qorders(n)
  (0...n).map{|n| random_id}.zip(select_questions(n))
end

def qorders_counts(qorders)
  qorders.map(&:last).reduce([], :concat).group_by{|x| x['qid']}.map_values(&:size)
end

qorders = make_qorders(50);nil

#puts;cooccurrences(qorders.take(50).map{|id, qs| [id, qs.map{|q|q['qid']}]}.map(&:last)).sort.map{|x| p x};nil
#puts;qorders.take(20).map{|id, qs| [id, qs.map{|q|q['qid']}]}.map(&:last).flatten.group_by{|x| x}.map_values(&:size).sort_by(&:first).map{|x| p x};nil

#pp qorders_counts(qorders).sort_by(&:last)
#puts;pp $question_types.map_values{|a| a.map{|q|q['qid']}};nil

puts;qorders.map{|id, qs| [id, qs.map{|q|q['qid']}]}.map{|qord| p qord};nil
