module Matches
  class CreateMatch
    Result = Struct.new(:success?, :match, :errors)

    def initialize(winner_id:, loser_id:)
      @winner_id = winner_id
      @loser_id  = loser_id
    end

    def call
      ActiveRecord::Base.transaction do
        match = Match.new(
          winner_id: @winner_id,
          loser_id:  @loser_id
        )

        if match.save
          Result.new(true, match, [])
        else
          Result.new(false, nil, match.errors.full_messages)
        end
     end
    end
  end
end
