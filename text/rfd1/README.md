---
start date: 2021-05-12
authors: Hayden Braxton <haydenbraxton@haydenbraxton.com>
state: implemented
---

# Request for Discussion

## Summary

This proposal introduces a workflow and format for RFDs (Request For Discussion)so that we can have transparent and constructive discussions primarily for, but not limited to (1) ideas for new features, processes, or design patterns and (2) changes to current systems. An RFD may be proactive, as in "Hey, we have this idea for a thing we think we should do." Or an RFD might be reactive, as in "Oh dang, we have a big product feature we need to add so it'd be better if we wrote up an RFD to chart out our plan of attack."

## Motivation

Writing down ideas for system enhancement while they are still nascent allows for important, actionable technical discussion. We capture these in Requests for Discussion, which are documents in the original sprit of the IETF Request for Comments, as expressed by RFC 3:

> The content of a note may be any thought, suggestion, etc. related to the software or other aspect of the network. Notes are encouraged to be timely rather than polished. Philosophical positions without examples or other specifics, specific suggestions or implementation techniques without introductory or background explication, and explicit questions without any attempted answers are all acceptable. The minimum length for a note is one sentence.

> These standards (or lack of them) are stated explicitly for two reasons. First, there is a tendency to view a written statement as ipso facto authoritative, and we hope to promote the exchange and discussion of considerably less than authoritative ideas. Second, there is a natural hesitancy to publish something unpolished, and we hope to ease this inhibition.

The philosophy of our Requests for Discussion is exactly this: timely rather than polished, with the immediate idea of promoting technical discussion. Over time, we expect that this discussion will often converge on an authoritative explanation of new functionality -- but it's entirely acceptable for an RFD to serve only as a vector of discussion. (We use the term "Requests for Discussion" in lieu of "Requests for Comments" to avoid conflation with the IETF construct -- and the more formal writing that it has come to represent.)

## Detailed Design

### When is an RFD needed?

The following are cases where an RFD may be helpful:

- An architectural or design decision
- Change to an API or command-line tool used by customers
- Change to an internal API or tool
- Change to a process

These are intentionally pretty broad categories. Use your best judgement or ask a friend if you're unsure of whether or not you should write and RFD. To be even more general, the following are good indications that you might need an RFD:

- you're tackling a big problem where you need design support
- you're making a breaking change
- you're making a decision that will impact other individuals or other products
- you need buy-in from others

### Anatomy of an RFD

The possible sections of an RFD and their description can be found in `scripts/0000-template.md`. Not all sections are required or are relevant for every proposal, but every RFD should at least communicate _why_, _what_, and _how_. Use your best judgement on what's necessary to best communicate your ideas.

### states

An RFD can be in one of the following six states:

#### 1. prediscussion

A document in the __prediscussion__ state indicates that the work is not yet ready for discussion, but that the RFD is effectively a placeholder. The __prediscussion__ state signifies that work iterations are being done quickly on the RFD in its branch in order to advance the RFD to the discussion state. Creeping on others' RFDs in this state is totally acceptable, but withold any feedback until the author moves the RFD to __discussion__. If the RFD involves a topic that you are interested in or have knowledge of, it's also acceptable to ask if you could collab with the author. However, be wary of _too_ many authors as that can increase the time to move an RFD to discussion.

#### 2. ideation

A document in the __ideation__ state contains only a description of the topic that the RFD will cover, providing an indication of the scope of the eventual RFD. Unlike the __prediscussion__ state, there is no expectation that it is undergoing active revision. Such a document can be viewed as a scratchpad for related ideas. Any member of the team is encouraged to start active development of such an RFD (moving it to the __prediscussion__ state) with or without the participation of the original author. It is critical that RFDs in the __ideation__ state are clear and narrowly defined.

#### 3. discussion

Documents under active discussion should be in the __discussion__ state. At this point a discussion is being had for the RFD in a Pull Request.

The __prediscussion__ state should be viewed as essentially a collaborative extension of an engineer's notebook, and the __discussion__ state should be used when an idea is being actively discussed. These states shouldn't be used for ideas that have been committed to, organizationally or otherwise; by the time an idea represents the consensus or direction, it should be in the __committed__ state.

#### 4. committed

Once (or if) discussion has converged and the Pull Request is ready to be merged, it should be updated to the __committed__ state before merge. Note that just because something is in the __committed__ state does not mean that it cannot be updated and corrected.

#### 5. implemented

Once an idea has been entirely implemented, it should be in the __implemented__ state. Comments on ideas in the __implemented__ state should generally be raised as issues -- but if the comment represents a call for a significant divergence from or extension to implemented functionality, a new RFD may be called for; as in all things, use your best judgment.

#### 6. abandoned

Finally, if an idea is found to be non-viable (that is, deliberately never implemented) or if an RFD should be otherwise indicated that it should be ignored, it can be moved into the __abandoned__ state.

### Workflow

#### Getting Started

All RFDs are kept in the rfd repository. To start a new RFD, clone this repo, and run the following script

```bash
$ ./scripts/new.sh "My title here"
```

This script creates the RFD outline for you, assigns it an RFD number, creates a branch, and pushes the branch.

Once you get started, make sure to fill out any appropriate metadata at the top of the page. The default state is __prediscussion__. Depending on your plans for the RFD, you may alternatively change the state to __ideation__. As your work on your RFD, don't feel like it needs to be perfect before pushing. It's totally okay and encouraged to work in the open. No one will judge you.

An RFD can remain in __prediscussion__ for as long as is necessary as you iterate on the idea. When you're ready to discuss with the broader group, it's time to move to the next step.

#### Discussion

Pull Requests are the vehicle for RFD discussion. When you're ready to start discussing, change the state to __discussion__, make sure all your changes are pushed, then open a PR into `master`. If no one has reviewed your RFD, you may have to solicit feedback. Once the discussion has reach consensus, it's time to merge your PR and move the state to __committed__. Discussion and changes can still happen after publishing, though.

#### Implementation

Once the RFD has been completely implemented, move it to the __implemented__ state. At this point, the RFD can still be changed, but if the suggested change represents a stark deviation from the original, then maybe an entirely new RFD is better. Either way, use your best judgement.

## Alternatives

[ADRs (Architecture Decision Records)](https://github.com/joelparkerhenderson/architecture_decision_record/blob/master/adr_template_by_michael_nygard.md) were also suggested as a format for documenting these kinds of conversations. Personally, I'm not a huge fan of the ADR format because it seems a little more rigid in it's structure and more tailored to recording a past decision rather than fostering conversation on an idea. I could be wrong though, and ADRs could very likely be adapted to encourage open discussion.

As a developer, I like using git, but there may be technical, non-developers (think product managers or customer success folks) who need to be a part of RFD conversations. If this is true, I would hate for git to exclude them from these conversations and we miss out on their feedback, in which case something like Confluence might be a better medium for RFDs. PRs allow for a more nuanced discussion process, but if Confluence invites more exposure, then maybe that's an acceptable trade-off.

And in an exciting turn of events, it turns out that we might use Notion as an organization at some point. That would be really exciting and Notion could be a nice medium for RFDs. In the near future, that might be a thing.

## Prior Art

Parts of this document are shamelessly copy-pasted from other sources. The document format here is relatively common when looking at other proposal processes. Inspiration for this proposal comes from the following sources:

- [Oxide RFD](https://oxide.computer/blog/rfd-1-requests-for-discussion/)
- [Rust RFCs](https://github.com/rust-lang/rfcs)
- [React RFCs](https://github.com/reactjs/rfcs)

[This article on Joyent's RFD process](https://www.joyent.com/blog/hitting-the-moon) does a great job of explaining the motivation behind RFDs. [RFC 3](https://datatracker.ietf.org/doc/html/rfc3) is kind of the godfather of RFCs/RFDs in general.

## Unresolved Questions

- Should each RFD have its own directory under `text`? This might allow for a little more flexibility, especially if the RFD includes images. _Yes. This is the current state of the world now._
- How do we track when one RFD supersedes or partly supersedes another? Should we add metadata field `superceded by: <link(s) to superceding RFD>`?
- How do we establish consensus?
- One area that I'm particularly looking for feedback on is the states. I'm not completely sold on the states listed here. I just copied them from someone else so please chime in if you feel like something is missing or have strong feelings about what the states should be.

## Future Possibilities

In the future, we could add some simple automation around RFDs. For example, we could have github actions handle things like validate states or change state based on some event. One could also imagine git hooks being useful for enforcing commit message format, directory structure, etc.

Some might want to consume RFDs in a different format so we could publish the markdown files as html, pdf, or whatever else is needed.

It would be cool to have some kind of index of all the RFDs. This ~~could~~ should probably be automated because if it were done manually it would waste a lot of time and probably still be wrong.

There will likely be future needs that this proposal doesn't cover. The most important part is getting started now so we have a forum for discussion, and we can adjust our process as needs arise.
