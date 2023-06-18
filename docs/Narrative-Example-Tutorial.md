*Guide written by AlexeiP*

*(Note: This guide is deprecated and kept for historical purposes. The described technique might not work as
well with the Clio model)*

## Introduction

Sometimes you have a great idea for a NovelAI story that involves an
unusual character. Very unusual. So much so that the AI has trouble
understanding how to accurately portray them. For example:

-   Your character is of a weird size, such as a tiny pixie or a large
    automaton, but the AI often forgets to take their size into account
    when describing the scene.
-   Your character belongs to a non-humanoid species, like a snake or an
    insect, but the AI describes them as having humanoid arms, legs, and
    hands.
-   Your character is a being with unusual characteristics, like an
    incorporeal ghost, a cyborg, or someone who doesn't see or speak,
    but the AI constantly forgets to take their specific traits into
    account.

The AI tends to repeat patterns found in most novels, which feature
characters of human shape and size, and with realistic abilities and
behavior. The AI naturally wants your character to behave the same way.
This can create problems for stories that strive to break the mould. How
do we help the AI break away from its usual patterns and portray our
character as intended? If merely explaining the character to the AI
doesn't work, maybe we can show it what we want, with the help of a
technique called a **narrative example**.

## What is a narrative example?

A narrative example is a lorebook entry that describes your character in
action. It uses the same tense, point of view, and writing style as the
main story, but focuses on the special aspects of our character. For
example, if the hero is a metal-plated cyborg, we would narrate how he
shrugs off bullet fire and hacks a security system remotely. If our
character is a giant spider, we would describe them using their many
legs to climb a vertical surface and spinning a web. The idea is to give
the AI an example scene to learn from.

### A word of caution on token budget

Since a narrative example is written in a descriptive way, we might need
to use a significant number of tokens. To keep it from using up too much
of our story context window, we'll make it very condensed and only long
enough to include everything we want the AI to learn. Depending on how
unusual our character is, we'll be using an entry between 150 and 300
tokens at most. We will also only use this technique when it's
absolutely necessary, so our token context window doesn't get
overwhelmed.

## Step 1. Identify our character's special characteristics.

For this tutorial, we're going to create an unusual science-fiction
character: **Swarmbot**, a living construct whose artificial body is
composed entirely of tiny flying robots called nano-bugs. This is an
intriguing idea, and one that could prove a challenge for the AI.

We will start by making a list of the character's unusual
characteristics:

-   Swarmbot is composed of an amalgam of flying nano-bugs that
    congregate together to form a single intelligent being.
-   By controlling the nano-bugs, Swarmbot can reconfigure his body to
    assume a variety of different shapes.
-   He can order the nano-bugs to disperse, becoming a cloud of tiny
    swarming robots, or to reassemble into a solid entity.
-   Swarmbot has a total 360-degree field of vision.
-   The nano-bugs can generate tiny electrical discharges that can sting
    humans or overload electronic devices.
-   Swarmbot can also have all the nano-bugs in his body emit
    electricity at the same time, generating a single deadly lightning
    bolt.
-   Swarmbot doesn't have human emotions and thinks in terms of programs
    and subroutines.

Now that we know what makes Swarmbot special, we are ready to put him in
our story.

## Step 2: Test how the AI portrays the character.

We'll start by creating a lorebook entry for Swarmbot and include all
the information from the list above, word for word.

Then, after making sure the entry is active, we give the following input
to the AI:

    Describe Swarmbot fighting a group of criminals in a robotics lab:

Then we press Enter. The first result we get reads like this:

    Swarmbot was created by Dr. Myron Swarms, a mad scientist who wanted to create a robot that could be controlled remotely from anywhere. A criminal organization had stolen his research data and were using it to build their own army of killer robots. 

    In order to escape, Myron made several modifications to his prototype, including adding new weapons systems and programming him with a set of basic commands. Myron discovered that the criminals had been building an entire army of robots. Myron vowed to stop them once and for all.

    The first battle took place in the main laboratory. The criminals had just finished creating a new model of robot when they heard a loud noise outside. They rushed out to see what was happening, only to find Swarmbot standing there with his arms crossed. He used his weapons to blast apart the control panel and freed Myron. After that, the two of them destroyed the robots together.

It isn't a bad story, but Swarmbot is barely present. Rather than
making the story about him, the AI made a human hero instead. We also
don't see Swarmbot use any of the traits and powers we've given him.

We erase this output and try again. The second time, we get this:

    In this scenario, the criminal gang is trying to steal an experimental prototype of a powerful new military robot from the research laboratory where it was developed. They have taken control of the security systems, so there is no way for Swarmbot to get inside without setting off alarms. The only way he can stop them is by physically attacking them with his hands. There are five criminals who need to be stopped. One of them is wearing a gas mask and carries a gun. He has been assigned the task of killing the other four if necessary.

    However, the prototype robot will kill any unauthorized persons who try to access its system. To make matters worse, one of the criminals has an explosive device strapped to his back, which will detonate when he dies.

    To win the fight, Swarmbot needs to learn how to use the prototype robot.

Once again the AI focuses much more on the human characters in the
story. In fact, the only time Swarmbot is involved, the AI has him use
his bare hands, instead of all the awesome abilities we've given him in
the lorebook. It looks like the AI isn't sure what to do with this
character, so we need to teach it by example, and to do that, we're
going to re-write his lorebook entry in a more narrative style.

## Step 3: Write the narrative example scene.

Now it's time to do some writing of our own. Keeping the previous
lorebook entry active and using the AI for assistance, we write the
following scene. It's long, but we'll trim it later. The important thing
is that it shows Swarmbot displaying all his traits and powers:

    Visual Analysis: five targets confirmed. Three on the ground level, and two on the upper floor. My nano-bugs swept through the building but couldn’t locate any more hostiles. I will proceed with my mission.

    I create a different subroutine to track the status of each hostile. I direct my nano-bugs to disassemble and float into the main lab like a swarm of fireflies. Each one is feeding me visual data. The image is fuzzy, but it gives me enough information to identify the three intruders as humans.

    My swarm flies into the room, then stops and hangs in midair. The three targets turn around. They are armed and look nervous. I direct my nano-bugs to attack them. They fly toward the humans and release their electric stings. One of the humans falls down and lies motionless on the ground.

    Mission Status: One target neutralized.

    I direct the nano-bugs to converge, creating a solid body for me. They lock together like puzzle pieces and create a humanoid shape. The shape that is me. The two remaining intruders run away from the lab. I give chase and follow them out of the building. As they move into an alleyway, I release a bolt of electricity. It hits one of the intruders and he falls down. The other one jumps over him and runs deeper into the alley.

This is a good starting point. However, it's 285 tokens long, so we need
to trim it down heavily, and also to change it to past tense to fit our
story.

![image](https://github.com/TapwaveZodiac/novelaiUKB/assets/35267604/a4a67be0-128d-433d-8b52-fd11ab0916e4)

## Step 4: Trim and Edit. {#step_4_trim_and_edit.}

We mercilessly trim down the scene we just wrote, keeping only the
important details we want the AI to retain about our character. After
adding a trimmed down version of our previous lorebook entry, we arrive
at this:

    I was a swarm of flying nano-bugs that congregated together to form a single intelligent being. By controlling the nano-bugs, I could reconfigure my body to assume a variety of shapes. I could make them disperse into a cloud of tiny buzzing robots or reassemble into a solid body. The nano-bugs could generate tiny electrical discharges capable of stinging humans or to overloading electronic devices, or release a single combined lightning bolt.

    Visual Analysis: five intruders confirmed. My nano-bugs swept through the building but didn’t locate any more hostiles.

    I created a different subroutine to track the status of each intruder. I then directed my nano-bugs to spread out and fly into the lab like a swarm of fireflies. Each one was feeding me visual data. They swarmed the terrified humans and released their electric stings. One hostile fell and was now lying motionless on the ground.

    Mission Status: One target neutralized.

    I directed the nano-bugs to converge, creating a solid body for me. They locked together like puzzle pieces to form my normal humanoid shape. Before the other intruders could react, I extended my arm and released a bolt of energy. Two of them were hit and fell before they could grab their guns.

This final entry is 263 tokens long. It's pretty costly, but all the
important information is included. Let's hope it gives us good results.

## Step 5: Test how the AI portrays the character with the new entry.

After making sure our new lorebook entry is active, we enter the same
prompt we used before, and hit Enter. This time, the AI generates this
output:

    My mind is a mass of electrical impulses. My body is a collection of millions of nanobots, each one with its own brain. These brains are connected by an intricate network. The individual minds work together as a single entity. The swarm has a common goal—to destroy the enemy.

    When I first began this mission, I was given a simple task—find the intruders and eliminate them. But the situation quickly changed. The intruders had weapons and fought back. This was not what I expected. I have never encountered anyone who could stand against me.

    The intruders were using the lab’s computer system to control my swarm. It took some time to figure out how they did it. Once I discovered the source of the problem, I used my nano-bug eyes to search for the intruders. When I found them, I attacked.

    One of the intruders fired at me. I responded by firing a lightning bolt. He fell unconscious, but the others kept attacking. I sent another bolt and killed two more. Now only three remained.

Where previously the AI seemed confused by our unusual protagonist, it
now portrays Swarmbot accurately and confidently, hardly needing any
additional input from the user.

![image](https://github.com/TapwaveZodiac/novelaiUKB/assets/35267604/019e7b17-5bdf-45a7-911b-a50a2c9cc7bc)


## Conclusion

As we've just seen, writing a lorebook entry in a way that shows the
character in action, rather than merely explains who they are, gives the
AI a pattern it can learn from, helping it execute any outlandish story
idea we can imagine.

Despite their usefulness, narrative example entries have drawbacks.
These include the relatively high number of tokens they use up, and the
extra time required to write them. However, when used carefully and
sparingly, they can be the magic bullet your story needs. Regardless of
whether your main character is a giant kaiju, a tiny mouse, or a
self-aware personification of the number Pi, no character idea is too
outlandish or silly for NovelAI, as long as it speaks to your
imagination as a storyteller.
