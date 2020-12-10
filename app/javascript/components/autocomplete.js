import 'js-autocomplete/auto-complete.css';
import autocomplete from 'js-autocomplete';

const autocompleteSearch = function() {
  const search = document.getElementById('search-data')
  if (search) {
    const skills = JSON.parse(search.dataset.skills)
    const searchInput = document.getElementById('query');



    if (skills && searchInput) {
      new autocomplete({
        selector: searchInput,
        minChars: 1,
        source: function(term, suggest){
            term = term.toLowerCase();
            const choices = skills;
            const matches = [];
            for (let i = 0; i < choices.length; i++)
                if (~choices[i].toLowerCase().indexOf(term)) matches.push(choices[i]);
            suggest(matches);
        },
      });
    }
  }
};

export { autocompleteSearch };


