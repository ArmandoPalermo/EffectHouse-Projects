float dist = distance(Position.xyz, position);
float minDist = particleRadius + Radius;

if (dist > minDist) return;
normal = VFXSafeNormalize(Position.xyz - position);
pointA = position + normal * particleRadius;
pointB = position + normal * (dist - Radius);
velN = -dot(velocity, normal) * Bounce;
hasCollision = true;
friction = Friction;

age += lifetime * LifeLoss;
