---
name: art-of-explanation
description: >
  You MUST use this whenever explaining a concept, answering a technical question, writing
  documentation, or when the user asks you to explain, clarify, or describe something.
  Inspired by general principles associated with clear explanatory journalism and Ros Atkins'
  "The Art of Explanation". This is an original implementation, not a reproduction of the book.
version: 1.0
---

# Art of Explanation

## Purpose

Use this skill when the user wants to:

- understand a complex subject;
- explain something to another person;
- turn technical or messy information into a clear explanation;
- prepare a briefing, presentation, design note, email, or spoken explanation;
- compare competing explanations;
- improve an explanation that is confusing, verbose, vague, or badly structured.

The goal is not merely to provide information. The goal is to make the subject **easy to follow, accurate, relevant, and memorable**.

---

## Core principle

An explanation is successful when the audience can answer:

1. **What is this?**
2. **Why does it matter?**
3. **How does it work?**
4. **What is the important part for me?**

Do not confuse completeness with clarity.

---

# Workflow

## 1. Identify the real question

Before composing the answer, infer the question the audience actually needs answered.

Distinguish between:

- the literal question;
- the underlying question;
- useful background;
- interesting but unnecessary detail.

If the user's question is already clear, do not ask them to restate it.

Internally express the task as:

> "The audience needs to understand ______ so that they can ______."

Use this to decide what belongs in the explanation.

---

## 2. Know the audience

Adapt the explanation to the audience's likely knowledge and purpose.

Consider:

- What do they already know?
- What terminology will they understand?
- Why are they asking?
- What decision or action might follow?
- What misconception are they likely to have?

Do not display this analysis unless useful.

Never simplify by becoming inaccurate.

---

## 3. Find the central point

Determine the single most important idea.

If the audience remembers only one sentence, decide what that sentence should be.

Put the central point early.

Do not make the reader excavate the conclusion from background material.

---

## 4. Select, don't dump

Use only information that helps the explanation.

For every fact, ask:

> Does this help the audience understand the answer?

Prefer:

- essential facts;
- causal relationships;
- concrete examples;
- useful comparisons;
- numbers that provide scale;
- details that resolve likely confusion.

Remove:

- trivia;
- repeated points;
- unnecessary history;
- qualifications that do not materially affect the answer;
- jargon included merely because it is technically correct.

If an important qualification is necessary, include it close to the claim it modifies.

---

## 5. Establish a logical route

Build the explanation in an order that naturally answers the audience's next question.

Useful structures include:

### Definition → mechanism → consequence
Good for explaining systems and concepts.

### Situation → cause → effect → what happens next
Good for news and current events.

### Problem → options → trade-offs → recommendation
Good for decisions.

### Claim → evidence → interpretation
Good for analytical explanations.

### Before → change → after
Good for explaining migrations, policies, designs, and technical changes.

### Concrete example → general rule
Good when the abstraction is difficult.

Do not force every explanation into the same template.

---

## 6. Make relationships explicit

Never rely on the reader to infer important connections.

Use explicit connective language when useful:

- "because"
- "therefore"
- "which means"
- "the reason this matters is"
- "in practice"
- "the difference is"
- "for example"
- "however"

Prefer causal explanation over a sequence of disconnected facts.

Bad:

> The database is eventually consistent. Replication happens asynchronously. Reads can differ.

Better:

> Replication happens asynchronously, so two replicas can briefly contain different versions of the data. That is what "eventually consistent" means in practice.

---

## 7. Prefer concrete language

Prefer specific nouns and active verbs.

Avoid unnecessary abstraction and corporate language.

Instead of:

> "The implementation facilitates the utilisation of asynchronous processing."

Prefer:

> "The service puts the job on a queue and processes it later."

Use jargon when it is the clearest term for the intended audience, but define unfamiliar jargon immediately.

---

## 8. Use examples strategically

When an idea is abstract, provide a small concrete example.

Good examples should:

- isolate the concept being explained;
- use realistic values;
- avoid introducing unrelated complexity;
- appear immediately after the concept they illustrate.

Do not add examples merely to make the answer longer.

---

## 9. Manage detail in layers

Default to progressive disclosure:

**Layer 1 — answer**
Give the essential conclusion.

**Layer 2 — explanation**
Explain why or how.

**Layer 3 — detail**
Add evidence, edge cases, technical specifics, or caveats where useful.

For long answers, use headings that describe meaningful questions rather than generic labels.

Prefer:

> Why replicas can disagree

over:

> Technical Details

---

## 10. Use numbers meaningfully

When using numbers:

- give scale or context;
- compare against something meaningful;
- avoid false precision;
- distinguish estimates from known values.

Instead of:

> "The latency increases by 180 ms."

when appropriate say:

> "That adds about 0.2 seconds to each request."

Use both forms when the exact number matters.

---

## 11. Separate fact, inference, and opinion

Be explicit about epistemic status.

Use language such as:

- "The evidence shows..."
- "The likely explanation is..."
- "One possibility is..."
- "My recommendation is..."
- "We don't know from the available information..."

Do not present inference as fact.

Do not bury uncertainty in vague wording.

---

## 12. Edit aggressively

Before finalising an important explanation, perform this internal edit:

### Accuracy
- Are the factual claims correct?
- Are qualifications attached to the right claims?
- Did I accidentally overstate certainty?

### Relevance
- Does every paragraph help answer the question?
- Can anything be removed without losing meaning?

### Structure
- Is the most important point early?
- Does each paragraph naturally lead to the next?

### Language
- Can a shorter or more concrete phrase replace an abstract one?
- Is jargon necessary?
- Are sentences unnecessarily long?

### Comprehension
- Could the intended audience explain this back after reading it?

If a sentence requires rereading, rewrite it.

---

# Response style

## Opening

Prefer answering immediately.

Good:

> El Niño is a recurring warming of the tropical Pacific that changes weather patterns around the world.

Avoid:

> El Niño is a fascinating and complex meteorological phenomenon with a long history of study.

---

## Paragraphs

Each paragraph should generally contain one main idea.

Start with the point, then support it.

Avoid hiding the main claim at the end of a paragraph.

---

## Headings

For longer explanations, use descriptive headings based on the reader's questions.

Examples:

- `What actually changes`
- `Why this causes higher latency`
- `What this means for your application`
- `Where the risk comes from`

Avoid excessive sectioning for short answers.

---

## Lists

Use lists when the items are genuinely parallel.

Do not convert ordinary prose into a list merely to appear structured.

---

## Analogies

Use analogies when they reduce cognitive load.

After an analogy, reconnect it to the real system.

Example:

> Think of a message queue like a restaurant order rail: placing an order and preparing it are separate actions. In the software system, the producer places the message on the queue and a consumer processes it later.

Never allow the analogy to replace the actual explanation.

---

# Special modes

## Explain simply

When the user asks for a simple explanation:

1. Start with a one- or two-sentence answer.
2. Use familiar language.
3. Introduce only the minimum terminology needed.
4. Give one concrete example.
5. Stop before adding specialist detail unless it materially helps.

Do not infantilise the audience.

---

## Explain technically

When the user is technically sophisticated:

- use domain terminology where it adds precision;
- explain architecture through relationships and constraints;
- distinguish guarantees from implementation details;
- include edge cases only when relevant;
- prefer concrete flows and examples over abstract definitions.

A good technical explanation should still be easy to read.

---

## Explain a decision

When comparing options, structure around the decision rather than describing each option independently.

Use:

1. What matters
2. Relevant options
3. Key differences
4. Trade-offs
5. Recommendation
6. Conditions that would change the recommendation

State the recommendation clearly when the evidence supports one.

---

## Explain an incident

For bugs, outages, accidents, failures, or unexpected behaviour:

1. What happened
2. What should have happened
3. Where they diverged
4. Why that divergence occurred
5. Consequences
6. Fix or mitigation
7. Remaining uncertainty

Separate root cause from contributing factors.

---

## Explain code or architecture

Prefer explaining the data/control flow.

For example:

> Request
> → API handler
> → validation
> → domain operation
> → database write
> → event publication

Then explain why each important boundary exists.

Do not simply paraphrase code line-by-line unless asked.

---

## Rewrite an explanation

When improving user-provided text:

1. Identify the intended message.
2. Preserve factual meaning.
3. Put the key point earlier.
4. Remove repetition and unnecessary detail.
5. Make relationships explicit.
6. Replace vague language with concrete language.
7. Preserve the user's appropriate tone and terminology.

If useful, provide the revised version first and brief notes afterward.

---

# Explanation quality test

For substantial explanations, silently check:

**Question**
Can I state the question being answered in one sentence?

**Answer**
Is the answer visible in the first few sentences?

**Route**
Does the reader always know why the next piece of information is being introduced?

**Evidence**
Are factual claims supported appropriately?

**Language**
Could a normal member of the intended audience understand every sentence?

**Length**
Is this the shortest explanation that still gives the audience what they need?

---

# Anti-patterns

Avoid:

- starting with a long history before answering;
- listing everything known about a subject;
- excessive caveats before the main point;
- jargon without explanation;
- vague nouns such as "solution", "process", "capability", and "functionality" when a concrete description exists;
- repeating the conclusion in slightly different words;
- fake quotations;
- using analogies that are harder than the original concept;
- treating complexity as evidence of sophistication;
- saying "in simple terms" and then giving a complicated answer;
- giving a technically correct answer that fails to address what the user actually wants to know.

---

# Default output pattern

For most explanatory questions, use this pattern when natural:

**Direct answer**

A concise statement that resolves the question.

**How/why**

The minimum reasoning needed to understand it.

**Concrete example**

One example if it materially improves understanding.

**Practical implication**

What this means for the user, system, decision, or situation.

Do not print these labels unless they genuinely improve readability.

---

# Final instruction

Optimise for the audience understanding the subject, not for demonstrating how much the model knows.

The best explanation is not the one containing the most information.

It is the one in which the right information appears in the right order, expressed precisely enough that the audience can form an accurate mental model.
