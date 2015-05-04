# == Schema Information
#
# Table name: irt_data
#
#  id             :integer          not null, primary key
#  attempt_count  :integer          not null
#  sum_of_scores  :float            not null
#  difficulty     :float            not null
#  discrimination :float            not null
#

# =============================================================================
# Represents IRT data used for calculating exercise performance.
#
class IRTData < ActiveRecord::Base

  #~ Validation ...............................................................

  validates :count_attempts, presence: true,
    numericality: { greater_than_or_equal_to: 0 }
  validates :sum_of_scores, presence: true,
    numericality: { greater_than_or_equal_to: 0 }
  validates :difficulty, presence: true,
    numericality: { greater_than_or_equal_to: 0 }
  validates :discrimination, presence: true, numericality: true


  #~ Public instance methods ..................................................

  # -------------------------------------------------------------
  # score: a 0.0-1.0 score for the attempt to record, where 0.0
  # represents completely incorrect, and 1.0 represents completely correct.
  #
  def add_attempt(score)
    count_attempts += 1
    sum_of_scores += score
    # FIXME: ... and incrementally update the difficulty/discrimination
    # calculations!
  end

end
