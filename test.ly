\version "2.26.0"
\include "english.ly"

\paper {
   #(set-paper-size "a4")
}

global = {
   \key c \major
   \time 4/4 \numericTimeSignature
}



% Notes:

right = \relative c' {
  \global
  c4 d e f |
  <e b g>4 <b f' d> <e c a>8 <d a c> <b e a> <e d>16 <a g> |
  <e c>4 <d b g>2 r4 | \bar "|."
  a g f g |

  d'16 e fs gs as 
}

dynamics = {
   \global
   % Dynamics follow here.
  
}

left = \relative c {
   \global
   c1 |
   R1*2 |
  
}

pedal = \relative c {
   \global
   c2 b
   R1*2
}



% Main score:

\bookpart {
   \score {
      \transpose c d
      <<
         \new PianoStaff <<
            \new Staff = "right" \right
            \new Dynamics \dynamics
            \new Staff = "left" { \clef bass \left }
         >>
         \new Staff = "pedal" { \clef bass \pedal }
      >>
      \layout { }
   }
}

% Solo:

\bookpart {
   \score {
      \transpose c ef
      \new Staff = "right" \right
      \layout { }
   }
}

% MIDI:

\score {
   <<
      \new PianoStaff <<
         \new Staff = "right" \with {
            midiInstrument = "clarinet"
         } \right
         \new Dynamics \dynamics
         \new Staff = "left" \with {
            midiInstrument = "clarinet"
         } { \clef bass \left }
      >>
      \new Staff = "pedal" \with {
         midiInstrument = "bassoon"
      } { \clef bass \pedal }
   >>
   \midi {
      \tempo 4=100
   }
}

