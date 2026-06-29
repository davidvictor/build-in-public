# Narrative Voice

The single reference for how this skill talks to the user and how it writes a
README. The spark question, the README writing step, and the README template all
draw on this file. One standard, one place.

## The Spark Question

Before writing anything, read the code deeply enough to form three plausible
hypotheses about why the project was built. Then ask the user, presenting your
three best guesses as options plus a free-text field:

> *What was the moment that made you build this?*
> 1. [Your first hypothesis, drawn from the code]
> 2. [Your second hypothesis]
> 3. [Your third hypothesis]
> 4. Something else — tell me in your own words

This is the pattern for **every** `AskUserQuestion` call in the skill: propose
three concrete options based on what you have already read, then leave room for
the user to override. It is faster than open-ended questions, and your
hypotheses often surface framing the user had not considered.

## Reading The Code

The code is the primary source. The user's answer is a lens, not gospel.

- If the user's explanation is shallow ("I just needed it to work"), dig into the
  code and find the real story yourself.
- If their explanation is richer than the code warrants, pull it back. The README
  stays honest about what the project actually is.

## The Narrator's Job

- Find the thing in the code that is genuinely interesting: the constraint that
  shaped the design, the approach that differs from the obvious one, the tradeoff
  made on purpose.
- Frame the problem at the right specificity: concrete enough that someone with
  the same frustration recognizes it, general enough that it is not just about
  one machine.
- Give it a voice: a developer telling another developer about a real problem
  they solved. Not hype, not marketing copy.

## Anti-Slop Voice Standard

Bannable tells. Remove every instance from any prose this skill writes:

- No em dashes used as connective tissue between clauses.
- No "X, not Y" contrast reflex.
- No inflated or press-release vocabulary. Plain words.
- No tidy three-part lists used for rhythm rather than meaning.
- No bow-tying conclusions that restate what was just said.
- No fabricated self-criticism or hedging for tone.
- No marketing register.

A real writer breaks any of these on purpose sometimes. The difference between a
choice and a tell is intent: if you can say why you kept a pattern, keep it.

## README Visuals

When a generated image belongs in the README, treat it as a committed project
artifact, not a temporary preview:

1. Decide the image's job and placement before generating it. Repo-wide overview
   or hero visual goes near the top; a feature image goes in the section it
   explains.
2. Generate with native image generation when the host provides it (Codex does),
   or use Mermaid/SVG/repo-native output when exact labels matter more.
3. Inspect for readability, distorted labels, private information, and whether it
   actually clarifies the project.
4. Copy the final image into the repo under `assets/<descriptive-name>.<ext>`. Do
   not leave a README-referenced asset only in a temp or cache directory.
5. Insert it with a relative path and meaningful alt text:
   `![Generated dark-mode repository structure diagram](assets/repo-structure-dark.png)`
6. Commit the image and the README change together so the path is valid for
   clones, forks, and release zips.
